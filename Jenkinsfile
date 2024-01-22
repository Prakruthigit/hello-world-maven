pipeline {
    agent any

    stages {

         stage('Checkout git') {
            steps {
                checkout scm
            }
        }
		
	stage('Gradle Build'){
            steps{
                sh "mvn clean package -DskipTests"
		sh "mv target/*.jar target/app_${BUILD_NUMBER}.jar"
            }
        }

	stage('Deploy in dev'){
		steps{
			script{
				if (BRANCH_NAME == 'dev'){
					echo "dev"
				}
			}
		}
	}

	stage('Deploy in new-branch'){
		parallel{
			stage('US'){
				when {
					expression{ anyOf { branch 'new-branch-*'; branch 'develop' }  }
				}
				steps{
					echo "US"
				}
			}
			stage('EU'){
				when {
					expression{ anyOf { branch 'new-*'; branch 'develop' }  }
				}
				steps{
					echo "EU"
				}
			}
		}
	}
    }    
}

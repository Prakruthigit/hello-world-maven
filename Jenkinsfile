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
		steps{
			script{
				if (BRANCH_NAME == 'new-branch'){
					echo "new-branch"
				}
			}
		}
	}

    }    
}

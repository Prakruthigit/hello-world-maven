def readProp;

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


	stage('Check prperty file'){
		steps{
			script{
				readProp = readProperties file: "pipeline-properties/test.properties"
				echo "The day is ${readProp['Monday']}"
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

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

	stage('Deploy'){
	      steps{
		      script{
			      if (BRANCH_NAME == 'develop'){
				      echo "Loop success in dev"
			      }
		      }
	      }
	}

	if (BRANCH_NAME == 'new-branch') {
		 stage('Prod or Pre-Prod'){
			parallel{
				stage('US') {
				      steps{
					      echo "US"
				      }
				}

				stage('EU'){
					steps{
						echo "EU"
					}
				}
			}
		}
	}

    }    
}

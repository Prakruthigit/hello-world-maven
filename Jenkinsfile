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

	stage('Prod or Pre-Prod'){
		if (BRANCH_NAME == 'new-branch') {
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

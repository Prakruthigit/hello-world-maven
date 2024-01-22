pipeline {
    agent any

    stages {

         stage('Checkout git') {
            steps {
                checkout scm
            }
        }

        stage('DEV Pipeline') 
        {
            steps{
                script{
                    if("$GIT_BRANCH" == 'develop') {
                        echo "Loop success"
                    }
                    else {
                        echo "Other branch"
                    }
                }
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

			      else if (BRANCH_NAME == 'qa' | BRANCH_NAME.startsWith('new-')) {
				      echo "Loop success in ${BRANCH_NAME}"
			      }
		      }
	      }
	}

	stage('Parallel'){
		parallel {
			stage('Deploy to us'){
				steps{
					echo "Hello US"
				}
			}

			stage('Deploy to EU'){
				steps{
					echo "Hello EU"
				}
			}
		}
	}
    }    
}

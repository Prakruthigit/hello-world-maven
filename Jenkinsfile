def readProp;
def runPipeline( readProp ) {
	echo "The day is ${readProp['branch.name']}"
}

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
				if (BRANCH_NAME == 'develop'){
					readProp = readProperties file: "pipeline-properties/develop.properties"
					echo "The day is ${readProp['Branch_name']}"
				} else if (BRANCH_NAME == 'qa') {
					readProp = readProperties file: "pipeline-properties/qa.properties"
					runPipeline( readProp );
				} else if (BRANCH_NAME == 'new-branch'){
					readProp = readProperties file: "pipeline-properties/new-branch.properties"
					runPipeline();
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

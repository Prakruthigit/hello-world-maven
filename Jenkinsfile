def readProp;
def runCommand(readProp){
	echo "The branch is ${readProp['Branch_name']}"
}

pipeline {
    agent any

    stages {

         stage('Checkout git') {
            steps {
                checkout scm
            }
        }
		
	stage('Maven Build'){
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
				} else if (BRANCH_NAME == 'qa') {
					readProp = readProperties file: "pipeline-properties/qa.properties"
					echo "The day is ${readProp['Branch_name']}"
				} else if (BRANCH_NAME == 'new-branch'){
					readProp = readProperties file: "pipeline-properties/qa.properties"
					echo "The day is ${readProp['Branch_name']}"
				} 
			}
		}
	}

	stage('Pass Property'){
		steps{
			script{
				runCommand(readProp)
			}
		}
	}

	
    }    
}

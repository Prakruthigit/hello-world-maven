def readProp;
def runPipeline( readProp ) {
	echo "The day is ${readProp['branch.name']}"
	echo "Commit Message: **${COMMIT_MSG}**"
	echo "Commit ID is: **${COMMIT_ID}**"
}

pipeline {
    agent any
    environment{
    	def COMMIT_MSG = sh (script: 'git log -1 --pretty=%B ${GIT_COMMIT}', returnStdout: true).trim()
	def COMMIT_ID = sh (script: 'git log --pretty=format:%h -n 5 ${GIT_COMMIT}', returnStdout: true).trim()

    }

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


	stage('Check property file'){
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

	
    }    
}

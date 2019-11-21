pipeline{
agent
{
lable "any"
}
Stages{
	stage("Clonig from Git repo"){
		steps{
			
			git branch 'feature' url: "https://github.com/veeresh1708/test.git"
			sh "echo 'Cloning the git code has been completed sucessfully"
		}
	}
	
	Stage("Building the Code"){
		steps{
			mvn clean install
			sh "echo 'Code build has been completed'"
		}
	}
	
	Stage("Sonar Analysis"){
		steps{
			withSonarQubeEnv('My SonarQube Server') {
                // Optionally use a Maven environment you've configured already
                withMaven(maven:'Maven 3.5') {
                    sh 'mvn clean package sonar:sonar'
                }
			}
		}
	}
	
	Stage ("Moving the war file to artifactory"){
		steps{
			tUpload (
                buildName: 'Test',
                buildNumber: '$buildbunber',
                serverId: 'artifactserverID ', // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
                specPath: 'jenkins-examples/pipeline-examples/resources/recursive-flat-upload.json'
			)
			sh "echo 'Uploading the artifact to artifactory has been completed'"
		}
	}
	stage ("Building the docker Image"){
		steps{
            withCredentials([usernamePassword(credentialsId: 'Docker_login', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
              sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              sh" docker build -t tomcat:buildimage$BUILD_NUMBER ."
              sh" docker tag tomcat:buildimage veereshvanga/abcabwebapp:buildimage$BUILD_NUMBER"
              sh" docker push veereshvanga/abcabwebapp"
            
           }
		}
	}
	staga("Deploying the image"){
		steps{
		
		}
	}
}
}

pipeline{
agent 
{
label "unix"
}

stages{
	stage("Cloning the git repo"){
		steps{
				build job: 'git repo cloe' , wait: false
				sh "echo 'Cloning is completed'"
		}
	}
	stage("Building the Code"){
		steps{
			build job: 'Maven Build' , wait: false
      			sh "echo 'Build completed with null errors' "
		}
	}
	stage("Creating Docker Image"){
		steps{
			withCredentials([usernamePassword(credentialsId: 'Docker_Id', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        		      sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              		      sh" docker build -t tomcat:buildimage$BUILD_NUMBER ."
              		      sh" docker tag tomcat:buildimage veereshvanga/pro_trucks:buildimage$BUILD_NUMBER"
              	 	      sh" docker push veereshvanga/pro_trucks"
			}
			      sh" echo 'Image pushed to Docker Hub Syucessfully'"
		}
	}
}
}

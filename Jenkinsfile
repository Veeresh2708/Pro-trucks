pipeline{
agent
{
lable " unix "
}

stages{
	stage("Cloning the git repo"){
		steps{
				build job: 'git repo cloe' 
				sh "echo 'Clonig is completed'"
		}
	}
	stage("Building the Code"){
		steps{
			build job: 'Maven Build'
      sh "echo 'Build completed with null errors "
		}
	}
}
}

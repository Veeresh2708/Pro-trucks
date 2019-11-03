pipeline{
agent 
{
label "unix"
}

stages{
	stage("Cloning the git repo"){
		steps{
				build job: 'git repo cloe' , wait: false
				sh "echo 'Clonig is completed'"
		}
	}
	stage("Building the Code"){
		steps{
			build job: 'Maven Build' , wait: false
      			sh "echo 'Build completed with null errors "
		}
	}
}
}

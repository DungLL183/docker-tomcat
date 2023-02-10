node{
	stage("scm checkout"){
		git 'https://github.com/DungLL183/docker-tomcat.git'
	}
	stage("maven build"){
		sh 'mvn clean package'
	}
	stage("docker build"){
		sh 'docker build -t dungll183/docker-tomcat:v4 .'
	}
	stage("docker push"){
		withCredentials([string(credentialsId:  'docker-creds', variable: 'dockerPassword')]) {
			sh 'docker login -u dungll183 -p ${dockerPassword}'
		sh 'docker push dungll183/docker-tomcat:v4'
		}
	}
	stage("deploy to tomcat server"){
		def dockerRun='docker run -it -p 8080:8080 --name my-app -d dungll183/docker-tomcat:v4'
		sshagent(['ssh-ec22']) {
			sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.12.3 ${dockerRun}'
		}
	}
}


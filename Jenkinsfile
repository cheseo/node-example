pipeline {
	agent { docker { image 'node:22.17.1-alpine3.22' } }
	stages {
		stage('build'){
			steps {
				sh 'node test.js'
			}
		}
		withCredentials([sshUserPrivateKey(credentialsId: "node-ssh", keyFileVariable: 'keyfile')]) {
			stage('deploy') {
				sh 'ssh -i ${keyfile} ubuntu@node.ec2.ashwink.com.np ./update'
			}
		}
	}
}

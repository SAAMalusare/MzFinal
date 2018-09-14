pipeline {
    agent none

	stages {	
        stage("Compile Build and Test") {
            agent {
                docker { image 'composer:1.6.5' }
            }
            stages {
               stage("Build") {
                   steps {
                       sh 'composer install'
                   }
               }
               stage("Test") {
                   steps {
                       sh 'vendor/bin/phpunit -c tests/unit/phpunit.xml tests/unit'
					   
                   }
               }
			   stage("Deployment Confirmation required") {
                   steps {
							echo 'All tests were passed.. shall I proceed with deployment :)'
							input message:'Proceed with Deployment?'
					   
                   }
               }
            }
        }

		stage("Deploy") {
			agent { label 'master' } 
			stages {
				
               stage("Compose-Build Stage") {
                   steps {
                       sh 'rm -rf ./db'
					   sh 'docker-compose build'
                   }
               }
               stage("Spining out Containers") {
                   steps {
                       sh 'docker-compose up -d'
                   }
               }
            }
            post {
                success {
                    echo 'Here you go !! all containers are running fine... '
                }
            }
		
		}
    }
}
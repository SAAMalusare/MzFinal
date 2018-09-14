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
            }
            post {
                success {
                    echo 'All tests were passed..'
					input message:'Approve deployment?'
                }
            }
        }
		stage("Deploy") {
			agent { label 'master' } 
			stages {
               stage("Compose-Build Stage") {
                   steps {
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
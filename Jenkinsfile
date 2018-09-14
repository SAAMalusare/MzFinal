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
                    echo 'All tests were passed.. Image has been Built'
                }
            }
        }
    }
}
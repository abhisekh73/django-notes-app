@Library('shared library') _
pipeline {
    agent { label "vinod" }

    stages {
        stage("hello") {
            steps {
                script {
                    hello()
                }
            }
        }
        stage("code") {
            steps {
                script {
                    clone("https://github.com/abhisekh73/django-notes-app.git", "main")
                }
            }
        }
        stage("Build") {
            steps {
                script {
                    docker_build("notes-app","5","abhisekh73")
                    //  sh "docker build -t ${dockerhubuser}/${ImageName}:${ImageTag} ."
                }
            }
        }
        stage("push to docker hub") {
            steps {
                script {
                    // def docker_push = load "${libraryResource 'docker_push.groovy'}"
                    img_push("notes-app","5")
                    // dockerPush(image: "notes-app", tag: "latest", registry: "abhisekh73")
                }
            }
        }  

        stage("deploy") {  
            steps {
                echo "deploying the code"
                sh "docker compose up -d"
            }
        }
    }
}

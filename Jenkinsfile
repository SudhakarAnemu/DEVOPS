pipeline{
    agent any
    stages{
        stage("checkout stages"){
            steps{
                echo"check code"
                ls -lrt /opt
            }
        }
        stage("build "){    
            steps{
                echo"mvn clean install"
            }
        }
        
        stage(" Test"){  
            steps{
                echo"mvn test"
            }
        }
      
        stage("sonarqube"){       
            steps{
                echo"check code"
            }
        }
        stage("qulity gates"){       //.........sonargates
            steps{
                echo"check code"
            }
        }
        stage("artifactes of code"){  //.........jfrog/nxeus
            steps{
                echo"check code"
            }
        }                             //........................................CI
        stage("deploy dev"){          //.........tomcat/anisable
            steps{
                echo"check code"
            }
        }
        stage("deploy uat"){          //.........tomcat/anisiable
            steps{
                echo"check code"
            }
        }
        stage("deploy prod"){        //.........tomcat/anisible
            steps{
                echo"check code"
            }
        }                            //..........................................CD
        
    }
}

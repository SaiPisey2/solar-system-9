pipeline {
  agent any

  environment {
    NAME = "solar-system"
    VERSION = "${env.BUILD_ID}-${env.GIT_COMMIT}"
    IMAGE_REPO = "spisey"
    ARGOCD_TOKEN = credentials('argocd-token')
    // GITEA_TOKEN = credentials('gitea-token')
  }
  
    
  stages {

    stage('Checkout'){
        steps {
            git branch: 'main', 
            credentialsId: 'jenkins-git', 
            url: 'https://github.com/SaiPisey2/solar-system-9.git'
        }
    }

    stage('Unit Tests') {
      steps {
        echo 'Implement unit tests if applicable.'
        echo 'This stage is a sample placeholder'
      }
    }

    stage('Build Image') {
      steps {
            sh "docker build -t ${NAME} ."
            sh "docker tag ${NAME}:latest ${IMAGE_REPO}/${NAME}:${VERSION}"
        }
      }

    // stage('Push Image') {
    //   steps {
    //     withDockerRegistry([credentialsId: "docker-hub", url: ""]) 
    //     {
    //       sh 'docker push ${IMAGE_REPO}/${NAME}:${VERSION}'
    //     }
    //   }
    // }

    // stage('Push Image') {
    //   steps {
    //     withDockerRegistry(credentialsId: 'docker-hub', url: 'https://hub.docker.com/repository/docker/spisey/solar-system/general') 
    //     {
    //       sh 'docker push ${IMAGE_REPO}/${NAME}:${VERSION}'
    //     }
    //   }
    // }

    stage('Push the artifacts'){
           steps{
                script{
                    sh '''
                    echo 'Push to Repo'
                    docker push ${IMAGE_REPO}/${NAME}:${VERSION}
                    '''
                }
            }
        }

    stage('Clone/Pull Repo') {
      steps {
        script {
          if (fileExists('gitops-argocd')) {

            echo 'Cloned repo already exists - Pulling latest changes'

            dir("gitops-argocd") {
              sh 'git pull'
            }

          } else {
            echo 'Repo does not exists - Cloning the repo'
            sh 'git clone -b feature-gitea git@github.com:SaiPisey2/gitops-argocd.git'
          }
        }
      }
    }
    
    stage('Update Manifest') {
      steps {
        dir("gitops-argocd/jenkins-demo") {
          sh 'sed -i "s#spisey.*#${IMAGE_REPO}/${NAME}:${VERSION}#g" deployment.yaml'
          sh 'cat deployment.yaml'
        }
      }
    }

    stage('Commit & Push') {
      steps {
        dir("gitops-argocd/jenkins-demo") {
          sh "git config --global user.email 'jenkins@ci.com'"
          sh 'git remote set-url origin git@github.com:SaiPisey2/gitops-argocd.git'
          sh 'git checkout feature-gitea'
          sh 'git add -A'
          sh 'git commit -am "Updated image version for Build - $VERSION"'
          sh 'git push origin feature-gitea'
        }
      }
    }

    stage('Raise PR') {
      steps {
        sh "bash pr.sh"
      }
    } 
  }
}

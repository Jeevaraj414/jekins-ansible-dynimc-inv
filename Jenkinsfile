pipeline {
  agent { 
  label 'ansiblenode'
  }
  environment {
   AWS_EC2_PRIVATE_KEY=credentials('ec2-private-key') 
  }
  
  stages {
    
    //Get the Code from GitHub Repo
    stage('CheckOutCode'){
      steps{
         git credentialsId: 'a383f70e-e564-4bef-bc90-1bb0e24bc8c5', url: 'https://github.com/Jeevaraj414/jekins-ansible-dynimc-inv.git'
      }
    }
     
    //Using Terrafrom can create the Servers
    
    
    
    //Run the playbook
    stage('RunPlaybook') {
      steps {
        sh "whoami"
        //List the dymaic inventory just for verification
        sh "ansible-inventory --graph -i inventory/aws_ec2.yaml"
        //Run playbook using dynamic inventory & limit exuection only fo tomcatservers.
        sh "ansible-playbook -i inventory/aws_ec2.yaml  playbooks/tomcat-setup.yaml -u ec2-user --private-key=$AWS_EC2_PRIVATE_KEY --limit mavenserver --ssh-common-args='-o StrictHostKeyChecking=no'"
      }
    }
  
  }//stages closing
}//pipeline closing

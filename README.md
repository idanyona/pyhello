# Initial Setup

## Base environment

The project was test on windows 11:
- wsl2 installed
- docker for windows (set to linux containers)


## Run Jenkins Server

- Create directory ./jenkins_configuration

- Run run.cmd

- Wait for the server to launch and access it [http://localhost:8080](http://localhost:8080)

- Provide initial password
  
  To get initial password run:
  ``` shell
  docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
  ```

- Install docker in jenkins
  
  ``` shell
   docker exec jenkins curl -sSL https://download.docker.com/linux/static/stable/x86_64/docker-17.09.1-ce.tgz | tar -C /usr/local/bin -xz --strip=1 docker/docker
  ```

- Select "Install Suggested Plugins"

- Set initial admin user

- Add docker pipeline plugin
  - in jenkins admin console go to "Manage Jenkins" -> "Manage Plugins" -> "Available Plugins"
  - search for "Docker Pipeline" 
  - select and install the "Docker Pipeline" plugin

- Set credentials:
  - in jenkins admin console go to "Manage Jenkins" -> "Manage Credentials" -> "System" -> "Global Credentials (unrestricted)"
  - click "Add Credentials"
  - select kind "Username with password"
  - select scope "Global (Jenkins, nodes, items, all child items, etc)"
  - set username to ```idany```
  - set password to ```xxxxxxxxxx```
  - set id to ```dockerhub```
  
## Create pipeline

- in jenkins admin console click "New Item"

- set name to ```pyhello```
- select the "pipeline" option and click ok
- under the general section check the GitHub project checkbox and set the Project url tp ```https://github.com/idanyona/pyhello```
- under the pipeline section set Definition to "Pipeline script from SCM"
- set SCM to "Git"
- set Repository URL to ```https://github.com/idanyona/pyhello```
- set Branch Specifier tp ```*/main```
- set Script Path to ```pyhello.Jenkinsfile```
- click save
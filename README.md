# ubuntu-docker-image

Started from this article https://www.codemag.com/Article/1811021/Docker-for-Developers


Docker commands from that article:

To build the image:
`docker build --rm -f Dockerfile -t ubuntu:troy .`

To run the image, mount the current directory as volume, and set port:
`docker run --rm -it -p 3000:8080 -v `pwd`:/work ubuntu:troy`

To commit changes to the docker image as a new image:
`docker container ls -a`
Copy the container ID, then:
`docker commit <containerID> ubuntu:troy-after-changes`

To exec a shell into the docker container:
`docker container ls -a`
Copy the container ID, then:
`docker exec -it <containerID> /bin/zsh`


This vscode doc also helped:
https://code.visualstudio.com/docs/containers/quickstart-node
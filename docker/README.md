# docker
Provisions a docker service running a single jenkins server.

The setup is based on the official documentation of jenkinsci: [https://github.com/jenkinsci/docker/blob/master/README.md](https://github.com/jenkinsci/docker/blob/master/README.md).

**pre-requisites:**
- docker (`17.03.1-ce`)

## usage

### enable swarm mode
```shell
docker swarm init
```

### deploy the stack
```shell
DOCKER_IMAGE_TAG=<tag> docker stack deploy -c docker-stack.yml jenkinsci
```

### access jenkins
Head over [http://127.0.0.1:8080](http://127.0.0.1:8080).

--
## development
- generate a new version of the docker image  
```shell
docker build -t marioluan/jenkinsci-2.6.3-alpine:latest .
docker tag marioluan/jenkinsci-2.6.3-alpine:latest marioluan/jenkinsci-2.6.3-alpine:<tag>
docker push marioluan/jenkinsci-2.6.3-alpine:latest
docker push marioluan/jenkinsci-2.6.3-alpine:<tag>
```

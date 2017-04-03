# Docker demo container for pimcore

This is a full featured Pimcore5 installation as a docker image. 
It fulfills all system requirements as well as all best practices (such as caching, ...). 
So this configuration can also be seen as a reference how to set up a suitable server for 
pimcore following best practices.

It is basically a modified version of: [pimcore Demo Docker GitHub Repository](https://github.com/pimcore/docker-pimcore-demo-standalone/)

## Building locally 
```
mkdir pimcore-demo
git clone https://github.com/christophluehr/docker-pimcore-demo-standalone.git ./pimcore-demo/
cd pimcore-demo
docker build -t pimcore/demo .
docker run -d -p 80:80 --name=pimcore_demo pimcore/demo
``` 

## Using Docker Hub
```
docker pull christophluehr/docker-pimcore-demo-standalone
docker run -d -p 80:80 --name=pimcore_demo christophluehr/docker-pimcore-demo-standalone
``` 

## Running pimcore
After starting the container it'll take some time until your pimcore installation is ready. This depends on your internet connection as well as on the available ressources on the host. 

You can check the status of your image at any time by using the following command: 
```
docker logs -f pimcore_demo
```

This image automatically exposes port 80 to the host, so after running the image you should be able to access the demo site via: 
```
http://IP-OR-HOSTNAME-OF-DOCKER-HOST/
http://IP-OR-HOSTNAME-OF-DOCKER-HOST/admin/
```

### Installation
```
http://IP-OR-HOSTNAME-OF-DOCKER-HOST/install.php
DB-User: project_user
DB-Password: secretpassword
DB-Name: project_database
```

### References

* [pimcore Demo Docker Hub Page](https://registry.hub.docker.com/u/pimcore/docker-pimcore-demo-standalone/) 
* [pimcore Demo Docker GitHub Repository](https://github.com/pimcore/docker-pimcore-demo-standalone/)


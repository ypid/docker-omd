docker-omd
==========

[Dockerfile](https://www.docker.com) for [Open Monitoring Distribution (OMD)](http://omdistro.org).

Build an Ubuntu-based OMD image as follows:

    git clone https://github.com/fstab/docker-omd
    cd docker-omd
    docker build -t="fstab/omd:v0.1" .

Run the image:

    docker run -t -i fstab/omd:v0.1

This will leave a shell open to access the container.

OMD will become available on [http://172.17.0.77/default](http://172.17.0.77/default).
The default login is `omdadmin` with password `omd`.
The IP address of the docker container may be different, to find it out run `ip addr` in the container shell.

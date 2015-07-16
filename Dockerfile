# Open Monitoring Distribution
#
# Forked from https://github.com/jwarlander/docker-omd
#
## Version: 0.1
# FROM debian:jessie
FROM ubuntu:14.04
MAINTAINER Fabian Stäber, fabian@fstab.de

RUN apt-get install -y lsb-release
RUN apt-get update

# Install OMD, see http://labs.consol.de/OMD/
RUN gpg --keyserver keys.gnupg.net --recv-keys F2F97737B59ACCC92C23F8C7F8C1CA08A57B9ED7 && \
    gpg --armor --export F2F97737B59ACCC92C23F8C7F8C1CA08A57B9ED7 | apt-key add -

# RUN repo_stage="testing" && \
RUN repo_stage="stable" && \
    dist="$(lsb_release --short --id | tr '[:upper:]' '[:lower:]')" && \
    codename="$(lsb_release --short --codename)" && \
    echo "deb http://labs.consol.de/repo/$repo_stage/${dist} ${codename} main" > /etc/apt/sources.list.d/omd.list

RUN apt-get update
# RUN apt-get update && apt-get install -y \
        # libpython2.7 \
        # omd
# RUN apt-get update && apt-get install -y \
        # omd-daily
## Need to preseed:
# While not mandatory, it is highly recommended that you set a password for the
# MySQL administrative "root" user.
#
# If this field is left blank, the password will not be changed.
#
# New password for the MySQL "root" user:

# # Set up a default site
# RUN omd create default
# # We don't want TMPFS as it requires higher privileges
# RUN omd config default set TMPFS off
# # Accept connections on any IP address, since we get a random one
# RUN omd config default set APACHE_TCP_ADDR 0.0.0.0

# # Add watchdog script
ADD entrypoint.sh /entrypoint.sh

# # Set up runtime options
# EXPOSE 5000
# ENTRYPOINT ["/entrypoint.sh"]

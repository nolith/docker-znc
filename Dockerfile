# version 0.0.1
# docker-version 0.6.6
FROM        ubuntu:12.04
MAINTAINER  Alessio Caiazza "nolith@abisso.org"

# Make sure the package repository is up to date.
RUN         echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN         echo "deb http://archive.ubuntu.com/ubuntu precise-backports universe" >> /etc/apt/sources.list
RUN         apt-get update

# Let's do this...
RUN         apt-get install -y bitlbee bitlbee-plugin-otr znc/precise-backports znc-dbg/precise-backports znc-dev/precise-backports znc-extra/precise-backports znc-perl/precise-backports znc-python/precise-backports znc-tcl/precise-backports && apt-get clean

RUN         useradd znc
ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/

USER        znc
EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]

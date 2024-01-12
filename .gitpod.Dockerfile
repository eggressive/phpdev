FROM gitpod/workspace-mysql:latest

USER gitpod

RUN echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
    && sudo apt-get update -q \
    && sudo apt-get -y install grc shellcheck \
    && sudo apt-get clean

# use a custom apache config.
COPY conf/apache.conf /etc/apache2/apache2.conf

# change document root folder to 'www'. It's relative to your git working copy.
ENV APACHE_DOCROOT_IN_REPO="www"
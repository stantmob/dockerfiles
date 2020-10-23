FROM jenkins/jenkins:lts
MAINTAINER Stant Corp <develop@stant.com.br>

USER root

# Node 10.x PPA
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN /bin/bash -c "source nodesource_setup.sh"
RUN rm nodesource_setup.sh

# Elixir dependencies
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
      dpkg -i erlang-solutions_2.0_all.deb && \
      rm erlang-solutions_2.0_all.deb

# Installing dependencies
RUN apt-get update && apt-get install -y curl \
      git \
      build-essential \
      default-libmysqlclient-dev \
      libxml2-dev \
      sudo \
      gawk \
      libreadline6-dev \
      libyaml-dev \
      libsqlite3-dev \
      sqlite3 \
      autoconf \
      libgmp-dev \
      libgdbm-dev \
      libncurses5-dev \
      automake \
      libtool \
      bison \
      pkg-config \
      libffi-dev \
      imagemagick \
      libqt4-dev \
      libqtwebkit-dev \
      xvfb \
      libfontconfig-dev \
      libjpeg-dev \
      libpq-dev \
      libqt4-dev \
      postgresql \
      libssl1.0-dev \
      nodejs \
      esl-erlang \
      elixir

# Cleaning apt
RUN apt-get clean && \
      apt-get autoclean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Docker usar config
RUN groupadd -g 118 docker
RUN usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Installing RVM, Ruby, and Bundler
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash
RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install 2.5.1"
RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install 2.4.1"
RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install 2.4.7"
RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm --default use 2.5.1"
RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm all do gem install bundler"

RUN usermod -aG rvm,docker jenkins

USER jenkins

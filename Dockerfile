FROM ubuntu:18.04

WORKDIR /home

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    build-essential \   
    curl \
    git \
    libexpat1-dev \
    libxml2-dev \
    libxslt-dev \
    openjdk-8-jre-headless \
    python \
    wget \
    zlib1g-dev && \
    wget http://meme-suite.org/meme-software/5.1.1/meme-5.1.1.tar.gz && \
    tar zxf meme-5.1.1.tar.gz && \ 
    rm meme-5.1.1.tar.gz && \
    mkdir Data && \
    curl -L http://cpanmin.us | perl - --self-upgrade && \
    cpanm File::Which HTML::PullParser HTML::Template HTML::TreeBuilder JSON XML::Simple XML::Parser::Expat && \
    git clone https://github.com/steuernb/NLR-Annotator.git && \
    echo 'PS1="\[$(tput setaf 3)$(tput bold)[\]docker:\\w]#\[$(tput sgr0) \]"' >> /root/.bashrc 

WORKDIR /home/meme-5.1.1

RUN ./configure --prefix=$HOME/meme --with-url=http://meme-suite.org/ --enable-build-libxml2 --enable-build-libxslt && \
    make && make install

ENV PATH="$HOME/meme/bin:${PATH}"
ENV PATH="$HOME/meme/libexec/meme-5.1.1:${PATH}"

WORKDIR /home/NLR-Annotator

RUN git checkout nlr_parser3

WORKDIR /home

ENTRYPOINT ["/bin/bash"]

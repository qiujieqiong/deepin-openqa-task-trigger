#!/bin/bash -e

image='deepin/openqa-base'
container='openqa-trigger'


function prepare_webui(){

    tar zcf openQA.tar.gz -C source/openQA .
    docker exec $container mkdir -p /data/openQA
    cat openQA.tar.gz | docker cp - $container:/data/openQA
    rm -f openQA.tar.gz

}

function prepare_trigger_server(){

    tar zcf openQAServer.tar.gz -C source openQAServer
    cat openQAServer.tar.gz | docker cp - $container:/data
    rm openQAServer.tar.gz

    docker exec pip3 install -r /data/openQAServer/requirements.txt

}

function prepare_source(){

    prepare_webui
    #prepare_trigger_server

}

function install_webui(){

    docker exec $container make -C /data/openQA install

}


function install_tools(){

    tar zcf openQA-tools.tar.gz -C openQA-tools .
    cat openQA-tools.tar.gz | docker cp - $container:/usr/bin
    rm -f openQA-tools.tar.gz

}

function replace(){

    tar zcf replace.tar.gz -C replace .
    cat replace.tar.gz | docker cp - $container:/
    rm -f replace.tar.gz

}

function build(){

    prepare_source
    install_webui
    replace
    install_tools

}

build


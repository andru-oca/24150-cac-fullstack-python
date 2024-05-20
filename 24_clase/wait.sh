#!/bin/bash

until docker compose logs mysql-server | grep "/usr/sbin/mysqld: ready for connections."; do 
    echo -n .; 
    sleep 1;
done

sleep 10
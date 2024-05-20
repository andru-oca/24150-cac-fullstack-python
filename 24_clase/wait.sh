#!/bin/bash

until docker compose logs db | grep "/usr/sbin/mysqld: ready for connections."; do 
    echo -n .; 
    sleep 1;
done

sleep 5
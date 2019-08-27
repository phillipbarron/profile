#!/usr/bin/env bash

# TODO: Does this work with Java 9?
# Java Keystore w/BBC CA Certificates

cp /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts $HOME/.certs/jssecacerts
keytool -import -trustcacerts -file $HOME/.certs/ca.pem -alias bbc-ca -keystore $HOME/.certs/jssecacerts -storepass changeit -noprompt
keytool -import -trustcacerts -file $HOME/.certs/cloud-ca.pem -alias bbc-cloud-ca -keystore $HOME/.certs/jssecacerts -storepass changeit -noprompt

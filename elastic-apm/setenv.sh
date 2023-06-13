#!/bin/bash
export JAVA_OPTS="$JAVA_OPTS -javaagent:/usr/local/tomcat/lib/elastic-apm-agent-1.39.0.jar"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.service_name=JavaPetStore-APM-Demo"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.application_packages=org.alanpeng,org.apmdemo.alanpeng"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.server_url=https://10.20.103.200:8200"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.secret_token=secrettokengoeshere"
export JAVA_OPTS="$JAVA_OPTS -Delastic.apm.verify_server_cert=false"

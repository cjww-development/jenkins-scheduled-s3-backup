timestamp=$(date +%Y-%m-%dT%H:%M:%S)
tar -cvf ./$timestamp.tar -C $JENKINS_HOME .
timestamp=$(date +%Y-%m-%dT%H:%M:%S)
touch $timestamp.tar
tar -cvf ./$timestamp.tar -C $JENKINS_HOME .
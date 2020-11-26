timestamp=$(date +%Y-%m-%dT%H:%M:%S)
touch ./$timestamp.tar
ls -al
tar --exclude=$timestamp.tar -cvf ./$timestamp.tar -C $JENKINS_HOME .
touch ./jenkins_backup.tar
tar --exclude=jenkins_backup.tar -cvf ./jenkins_backup.tar -C $JENKINS_HOME .
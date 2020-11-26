touch ./jenkins_backup.tar
ls -al
tar --exclude=jenkins_backup.tar -cvf ./jenkins_backup.tar -C $JENKINS_HOME .
echo "  Change database connection  "

sed -i -e 's/%USERNAME_DEV%/root/g;
s/%PASSWORD_DEV%/dimadima2020/g; 
s/%DATABASE_DEV%/crate/g;
s/%HOST_DEV%/192.168.1.28/g;
s/%USERNAME_PROD%/root/g;
s/%PASSWORD_PROD%/dimadima2020/g;
s/%DATABASE_PROD%/crate/g;
s/%HOST_PROD%/192.168.1.28/g' /home/gitlab-runner/builds/YBsBoT16/0/root/crate/code/api/src/config/database.json
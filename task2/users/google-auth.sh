groupadd google-auth
gpasswd google-auth -M root
mkdir /google-auth/
echo "root" > /google-auth/authusers
chgrp google-auth /google-auth/authusers
chmod ug=rwx,o= /google-auth/authusers

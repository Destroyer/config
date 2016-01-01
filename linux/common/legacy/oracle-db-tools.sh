#!/bin/bash
mkdir -p ~/_apps/sqlplus
wget "https://owncloud.cesnet.cz/public.php?service=files&t=351dd1200d11d431198f1f7a27c31719&download" -O sqldeveloper-4.1.3.20.78-no-jre.zip
wget "https://owncloud.cesnet.cz/public.php?service=files&t=572ba7e535eaf81c37e9bbc19f04ecc2&download" -O oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
wget "https://owncloud.cesnet.cz/public.php?service=files&t=ff714dbd1743eea3f89f2f70238e2925&download" -O oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
wget "https://owncloud.cesnet.cz/public.php?service=files&t=515f335ac98e3bf4ff02454d443801c5&download" -O oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

unzip sqldeveloper-4.1.3.20.78-no-jre.zip -d ~/_apps/
echo "This may take some time - installing sqlplus"
alien -i oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
alien -i oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
alien -i oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
echo -e 'export ORACLE_HOME=/usr/lib/oracle/12.1/client64\nexport PATH=$PATH:$ORACLE_HOME/bin' > /etc/profile.d/oracle.sh
echo "/usr/lib/oracle/12.1/client64/lib/" > /etc/ld.so.conf.d/oracle.conf
ldconfig

cat > ~/_apps/sqlplus/runme.sh <<'_EOF'
#!/bin/sh
# Script that runs sqlplus

LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
 
NLS_LANG=american_america.utf8
# tnsnames.ora location
TNS_ADMIN=~/_apps/sqlplus/
TWO_TASK=ora
 
export TWO_TASK NLS_LANG TNS_ADMIN
 
/usr/lib/oracle/12.1/client64/bin/sqlplus
_EOF

cat > ~/_apps/sqlplus/tnsnames.ora <<'_EOF'
ora =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = hostname)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SID = oracle)
    )
  )
_EOF
#!/bin/bash
mkdir -p ~/_apps/sqlplus
wget --content-disposition "https://dl.dropboxusercontent.com/u/31560509/sqldeveloper-4.1.3.20.78-no-jre.zip?dl=1"
wget --content-disposition "https://dl.dropboxusercontent.com/u/31560509/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm?dl=1"
wget --content-disposition "https://dl.dropboxusercontent.com/u/31560509/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm?dl=1"
wget --content-disposition "https://dl.dropboxusercontent.com/u/31560509/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm?dl=1"

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

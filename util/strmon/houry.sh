#!/bin/bash
#
# houry.sh: houry update of stream monitor pages
#
DATE=$1
if [ "$2" ] ; then HOUR=$2; else HOUR=00; fi

GENQC=./genqc.sh
GENPAGE=./genhtml.sh
FTP_HOST=gpspp.sakura.ne.jp
FTP_DIR=strmon
FTP_USER=gpspp
FTP_PASSWD=eb243t7ges
PAGE1=strmon.htm
PAGE2=monitor.htm
PAGE3=dataqc.htm
REP1=strmon`ech $DATE | sed 's@/@@g'`$HOUR.txt

# generate qc report
$GENQC $DATE $HOUR

# update html pages
$GENPAGE -p 1
$GENPAGE -p 2
$GENPAGE -p 3

# upload image
ftp -p -n -v -i $FTP_HOST >> $FTP_LOG 2>&1 << EOT

user $FTP_USER $FTP_PASSWD
cd $FTP_DIR
lcd html
cd html
put $PAGE1
put $PAGE2
put $PAGE3
lcd ../rep
cd ../rep
put $REP1
quit
EOT

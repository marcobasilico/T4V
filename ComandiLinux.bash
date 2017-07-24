Per aggiungere un nuovo utente, usare il comando useradd:

useradd -m -g <nome_gruppo_iniziale> -G <nomi_gruppi_aggiuntivi> -s <login_shell> <nome_utente>

useradd -G nome_gruppo nuovo_utente

usermod -G nome_gruppo nome_utente

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per aggiungere un nuovo utente ed inserirlo in un gruppo presente:

useradd -m -g users -G <nome_gruppi_iniziali> -s <login_shell> <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per aggiungere un utente ad altri gruppi usare:

usermod -aG <nome_gruppi_aggiuntivi> <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare la password dell utente, digitare:

passwd <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per cancellare un utente:

userdel -r <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per visualizzare l appartenenza ai gruppi con il comando groups:

$groups <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per cambiare il proprietarei di una directory/file:

chgrp <nome_gruppo> <nome_directory/nome_file>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un nuovo gruppo usare il comando groupadd:

groupadd <nome_gruppo>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Aggiungere un utente ad un gruppo con il comando gpasswd:

gpasswd -a <nome_utente> <nome_gruppo>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per eliminare un gruppo esistente:

groupdel <nome_gruppo>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per rimuovere un utente da un gruppo:

gpasswd -d <nome_utente> <nome_gruppo>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per guardare i processi di un utente:

ps -ef | grep <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere la memoria libera:

free

oppure:

watch -n 1 cat /proc/meminfo

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per cancellare la cache:

sudo sync; echo 3 > /proc/sys/vm/drop_caches

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Mostrare le CPU:

pmcycles -m

oppure

lsdev -Cc processor

oppure su RedHat:

cat /proc/cpuinfo | grep processor | wc -l

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Mostrare tutte le caratteristiche hardware della macchina:

lshw

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per disabilitare completamente il firewall bisogna eseguire questi 3 comandi:

service iptables save
service iptables stop
chkconfig iptables off

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per montare un FileSystem:

sudo mount -t cifs <nome_filesystem> <directory_dove_montare> -o domain=EUROPE,username=itambi,uid=501,gid=501,iocharset=utf8,dir_mode=0755,file_mode=0777

Esempio:

sudo mount -t cifs //itasmi10/STICDepot /sas/SASDepot -o domain=EUROPE,username=itambi,uid=501,gid=501,iocharset=utf8,dir_mode=0755,file_mode=0777

inserire poi la password dell account

Per smontare un FileSystem:

umount <nome_filesystem>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere che processo è in esecuzione su una porta:

netstat -tulpn | grep --color :<numero_porta>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere i processi di un singolo utente:

ps -ef | grep <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere tutti i processi in esecuzione:

top

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per verificare chi fa parte di un gruppo:

grep <nome_gruppo> /etc/passwd

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Serve per vedere lo spazio:

cd /sas9.3/sas/sasperm/<nome_metadata>/Lev1/SASApp; du -g 2>/dev/null | short +nh | grep -v ".*/.*/" | head -20;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Vedo tutti i volum group definiti:

lsvg 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Vedo le caratteristiche di un VG:

lsvg <nome_volum_group>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Vedere i fileSystem su AIX:

df -gt | grep <nome_di_quello_che_si_vuole_cercare>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un file tar.gz in AIX:

#Creo il file .tar
tar -cvf <path_dove_creare_lo_zip>/<nome_dello_zip>.tar <nome_directory_da_zippare>

#Creo il file tar.gz
gzip <path_dove_creare_lo_zip>/<nome_dello_zip>.tar

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per estrarre un file tar.gz in AIX:

#Estrarre il file .tar.gz
gunzip <path_dove_cè_lo_zip_creato>/<nome_dello_zip>.tar.gz

#Estrarre il file .tar
tar -xf <path_dove_cè_lo_zip_creato>/<nome_dello_zip>.tar

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per decomprimere un file .tar.gz:

gunzip -c <nome.tar.gz> | tar -xf -

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per listare il contenuto di un tar.gz:

gtar tzf <nome_archivio.tar.gz>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un file .gz:

gzip -c /sasdatacrms/saslabeu/ftp/skcubis/import/*.sas7bdat > /sasdatacrms/saslabeu/ftp/skcubis/import/backup/prova.sas7bdat.gz

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per killare tutti i processi di un utente:

pkill -p -u <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Esempio di sed. Sostituisce i ' ' in '#'. Poi con cut stampa solo quello che interessa:

df -gt | grep sasperm | sed -e 's/ /#/g' | cut -d '#####' -f2


oppure per ottenere lo stesso risultato è possibile usare awk:


df -gt | grep sasperm | sed -e 's/ /#/g' | awk '{print $1}'


oppure:

sed 's:%::'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per generare un file di testo:

---> Gli '' non vanno messi (messi per non evidenziare il testo in modo sbagliato)

'cat << eof > test.txt
> 1:2:3:4:5
> eof'	

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere la RAM della macchina in AIX:

prtconf -m

oppure

vmstat

oppure

svmon -G

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere se una macchina raggiunge un altra macchina:

telnet <remote_machine> <numero_porta>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere le porte presenti sul sistema:

netstat -an -f inet

oppure:

lsof -i | grep <numero_porta>

oppure:

netstat -an | grep <numero_porta>

oppure in Red Hat:

netstat -tulpn | grep --color :<numero_porta>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere tutti i processi di un determinato utente:

ps -u <nome_utente>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

per vedere i 10 processi che consumano più cpu:

ps aux | sort -n -k 3 | tail -10

USER	PID		%CPU	%MEM	SZ		RSS		TTY 	STAT	STIME	TIME	COMMAND

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere i 10 processi che consumano più memoria:

ps aux | sort -n -k 4 | tail -10

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Mostrare tutti i processi di ogni utente in modo ordinato tenedo solo le colonne che ci interessano:

ps -ef | sort | awk '{print $1 "   " $2 "   " $5 "   " $8 "   " $9}'

UID   PID   STIME   CMD

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere la versione java utilizata da SAS:

java -jar <nome>

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per killare tutti i processi di un utente in AIX:

ps -ef | grep <nome_utente> | awk '{ print $2 }' | xargs kill -9

oppure:

script che ho fatto io presente sulla 202

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per testare un qualcosa:

ps -ef | grep <nome_utente> | grep -v 'bash' | grep -v '\-ksh' | grep -v 'sshd' | grep -v 'ps \-ef' | grep -v 'grep' | awk '{printf("%s ",$2)}'
| xargs kill

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Il seguente esempio rimuove tutte le accidentali Jr precedute da uno spazio (Jr) all interno del file filey:                                                                                                                                        

cat filey | sed s/\ Jr//g

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per copiare un file da una macchina all altra nel cluster:

scp -p groups.sas7bdat root@ussaspa221.resource.unicreditgroup.eu:/sasdatacrms/data2/projects/a060_BFI_EWS/lev1/output/tmp

oppure:

scp -p *.sas* ugisadm@ussaspa221.resource.unicreditgroup.eu:/sasdatacrms/data2/projects/a060_BFI_EWS/lev2/output/db

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere in quale VG è presente un FS:

lsvg | while read bau; do echo $bau >&2; lsvg -l $bau; done | grep <nome_filesystem>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un file vuoto su linux:

dd if=/dev/zero of=<path_dove_creare_il_file>/<nome_file> bs=4k count=2400000

250000 = 1GB

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare una chiave pubblica RSA in lunux:

ssh-keygen -b  1024 -t  rsa

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Vedere le caratteristiche di un utente:

lsuser -f <matricola_utente> | head -n 20

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Comandi personalizzati SASLab (ugisadm e la mia utenza):

vg $1 ---> vedere in che VG si trova il FS passato come argomento

fs $1 ---> vedere le caratteristiche del FS passato come argomento

psu $1 ---> vedere i processi dell utente passato come argomento

lu $1 ---> vedere le caratteristiche dell utente passato come argomento

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Cercare una stringa all interno di diversi file:

grep -in "<stringa_da_cercare>" *

esempio:

cd /sas9.3/sas/sasperm/meta2/Lev1/SASApp3; grep -in "DB2CODEPAGE" * ---> cerca la stringa DB2CODEPAGE in tutti i file presenti nella pwd

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per cercare qualcosa in modo dettagliato:

ps -ef | grep -i process

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un link simbolico:

ln -s <percorso_da_linkare> <nome_link>

Esempio:

ln -s /sasdatacrms/dati2/DQ_SEGM_CRED DQ_SEGM_CRED

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

find /sas9.3/sas/sasperm -type d -name 'Logs' 2> /dev/null | egrep '\/WorkspaceServer\/|ConnectServer|\/BatchServer\/'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per mostrare i processi appesi sul cluster:

ps -ef | grep -v "root" | grep -v "ugisadm" | grep -v "sasins" | grep -v "sashost1" | grep -v "srvde02" | grep -v "mon_epv" | grep -v "srvcrdwh" | 
grep -v "sasdqexc" | grep -v "sassr1" | grep -v "lpar2rrd" | grep -v "lsfadmi1" | grep -v "sassrvv" | grep -v "srvtrxp" | grep -v "sasslw" | 
grep -v "splunk" | grep -v "srvdata3" | grep -v "daemon" | grep -v "sassrv6" | grep -v "srvtrxv" | grep -v "srvtrxt" | grep -v "srvde01" | 
grep -v "sassrv2" | grep -v "sassrv5" | grep -v "srvdata0" | awk '{print $5 "   " $7 "   " $1 "   "$2}' | sort > /sas9.3/sas/home/users/ee39976/work/ps_oggi.txt

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per tutti gli utenti (no utenze tecniche) sul cluster:

cat /etc/passwd | awk -F: '{print $1}' | grep -v "mon_epv" | grep -v "lpar2rrd" | grep -v "splunk" | grep -v "daemon" | grep -v "_" | grep -v "aix"| grep -v "pal"| 
grep -v "sas" | grep -v "srv" | grep -v "adm" | grep -v "ftp" | grep -v "db2" | grep -v "db29" | grep -v "grd" | grep -v "ora" | grep -v "guest" | grep -v "andrea" | 
grep -v "bin" | grep -v "beta48" | grep -v "edpakarl" | grep -v "lsf" | grep -v "file" | grep -v "hacmp" | grep -v "invscout" | grep -v "ipsec" | grep -v "lp" | 
grep -v "lpd" | grep -v "lsuser" | grep -v "root" | grep -v "nobody" | grep -v "nuucp" | grep -v "operator" | grep -v "paml" | grep -v "patrol" | grep -v "pclari" | 
grep -v "peurope" | grep -v "phold" | grep -v "phrdb" | grep -v "pima" | grep -v "pmta" | grep -v "ppriva" | grep -v "ppwwhh" | grep -v "provamp" | grep -v "psrs" | 
grep -v "pubcasa" | grep -v "pusi" | grep -v "pxelion" | grep -v "pxrs" | grep -v "ska" | grep -v "secuser" | grep -v "snapp" |  grep -v "spazio" | grep -v "sshd" | 
grep -v "sudomgr" | grep -v "sys" | grep -v "test" | grep -v "trsvprik" | grep -v "tuj" | grep -v "tuq" | grep -v "prj" | grep -v "lv1" | grep -v "lv2" | grep -v "prd" | 
grep -v "scp" | grep -v "ucmdbddm" | grep -v "usdoc" | grep -v "ee29597" |grep -v "usjprobe" | grep -v "ut00023" | grep -v "uucp" | grep -v "rsk" | sort > $pathfile/user.txt

oppure

cat /etc/passwd | awk -F: '{print $1}' | grep -v "mon_epv|lpar2rrd|splunk|daemon|_|aix|pal|sas|srv|adm|ftp|db2|db29|grd|ora|guest|andrea|bin|beta48|edpakarl|lsf|file|hacmp|invscout|ipsec|lp|
lpd|lsuser|root|nobody|nuucp|operator|paml|patrol|pclari|peurope|phold|phrdb|pima|pmta|ppriva|ppwwhh|provamp|psrs|pubcasa|pusi|pxelion|pxrs|ska|secuser|snapp| spazio|sshd|sudomgr|sys|test|
trsvprik|tuj|tuq|prj|lv1|lv2|prd|scp|ucmdbddm|usdoc|ee29597|usjprobe|ut00023|uucp|rsk" | sort > $pathfile/user.txt

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Mandare mail su RedHat:

echo "This is an example" | mailx -s "This is the subject" -S smtp="mailgwc.unicreditgroup.eu:25" MBasilico.external2@unicredit.eu

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Refresh metadati:


%let SASLibrary=inparts;
%lab_refresh_metadata(meta2,Foundation,&SASLibrary);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

for vg in $(cat /sas9.3/sas/home/users/ee39976/work/vg.txt) ; do echo $vg; lsvg -l $vg | grep a068 ; done

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere i processi in uso dagli utenti su un meta:

for user in $(ps -ef | grep ussasm05 | awk '{print $1}'); do cat /etc/passwd | grep -w $user | awk -F: '{print $1 "---->"$5}'; done

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere una sola riga di un file:

sed -n <numero_riga>p <nome_file>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere ogni VG e i rispettivi FS:

for vg in $(lsvg) ; do echo $vg>>/sas9.3/sas/home/users/ee39976/work/testing/PROVA.txt ; lsvg -l $vg | awk '{print $7}' >> /sas9.3/sas/home/users/ee39976/work/testing/PROVA.txt ; done

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per eseguirie un comando insieme ad un find:

andare nel path da anlizzare e lanciare:

find . -name "*.sh" -type f -exec grep -i "tukb101" {} * \;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per modificare una stringa di questo tipo:

{"templateUid":"MODEL_MAX_RUN_TIME","rows":[["SC",100],["RISB",100],["RIC",100],["MI",100],["SOV",100],["MNC",100],["GPF",100],["FI",100]]}

in un output di questo tipo:

"templateUid""MODEL_MAX_RUN_TIME"
"SC",100
"RISB",100
"RIC",100
"MI",100
"SOV",100
"MNC",100
"GPF",100
"FI",100

utilizzare il seguente comando:

"cat CRM.txt | sed -e s/{//g -e s/://g -e 's/\[/''/g' -e 's/\]/%/g' -e 's/}//g' | sed -e s/'"rows"'/%/g -e 's/\,%/%/g' -e 's/\%,/%/g' -e 's/%%//g' -e 's/%%//g' | tr "%" "\n""

oppure:

cat CRM.txt | sed -e s/{//g -e s/://g -e 's/\[/''/g' -e 's/\]/''/g' -e s/}//g | awk -v k=text '{n=split($0,a, "rows"); for (i=1; i<=n; i++) print a[i]}' 
			| sed -e s/',"'/',"rows"'/g -e s/'""'/'"'/g -e s/'","rows"'/text/g | sed -e s/'"rows'/%/g | sed -e s/text/',"rows"'/g | tr "%" "\n"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per verificare la connessione ad LDAP:

ldapsearch -x -v -h 'ldap.intranet.unicreditgroup.eu' -p 389 -D "uid=saswebreport,ou=Users,dc=unicreditgroup,dc=eu" -b "ou=People,dc=unicreditgroup,dc=eu" -w "<password>" -x "cn=<utente>"

Per vedere le informazioni di un utente:

ldapsearch -x -h 'ldap.intranet.unicreditgroup.eu' -b "ou=People,dc=unicreditgroup,dc=eu" "uid=<utente>"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

per ricavare owner e group di una cartella:

find . -type d -ls 2>/dev/null | awk '{printf("%s;%s;%s;%s\n",$NF,$5,$6,$3)}'

directory=`echo $payload | cut -d '#' -f 1`
owner=`echo $payload | cut -d '#' -f 2`
grp=`echo $payload | cut -d '#' -f 3`

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per cercare più coe contemporaneamente con il grep:

cat /etc/passwd | egrep "sashost|sassr|sascz01"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per creare un tunnel ssh:

dal localhost del Moba digitare:

ssh -f sasinst@analytics.blueteamtravelgroup.com -L 2000:analytics.blueteamtravelgroup.com:9432 -N

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per vedere su che porta è in ascolto un processo:

netstat -lntp | grep <pid_processo>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Per eseguire una ricerca non ricorsiva:

find . ! -name . -prune -print

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Trace logging VA:

egrep -in "http://www.yale.edu/tp/cas|<cas:user>" /opt/sas/config/Lev1/Web/Logs/SASServer1_1/SASLogon9.4.log | awk '{print $1 " " $2}' | sed -e 's/^[0-9]*//g' | 
sed -e 's/,[0-9]//g' | sed -e 's/<cas:user>//g' | sed -e 's/^://g' | sed -e 's:saspw</cas:saspw:g' | sed -e 's/:user>//g' | sed -e 's:</cas::g' > /opt/sas/loggingVA/logging_VA.txt

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

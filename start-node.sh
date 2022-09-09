#!/bin/bash

NODES="node1"
BASEFOLDER=$(pwd)
DBMIGRARION=0
if [ -z "$JAVA_HOME" ]; then
   echo "JAVA_HOME is not set..."
   exit;
fi
while getopts ':h:n:d:m:' option; do
   case $option in
      h) # display Help
         echo "Eg. ./start-node.sh -n gs,hsbc,mas -d /mnt/linux-data/apps/corda/nodes"
         exit
         ;;
      n) # Enter a name
         NODES=($(echo "$OPTARG" | tr ',' '\n'))
         ;;
      d) # base folder
         BASEFOLDER=$OPTARG
         ;;
      m) # migration scripts
         DBMIGRARION=$OPTARG
         ;; 
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;
   esac
done
shift $(( OPTIND - 1 ))

NODEFOLDER=$BASEFOLDER/$NODE

for NODE in "${NODES[@]}"
   do
      NODEFOLDER=$BASEFOLDER/$NODE
      cp cordapps/*.jar $NODEFOLDER/cordapps
      if [ $DBMIGRARION -eq 1 ]; then
         echo " DB Migration node ${NODE} in ${NODEFOLDER}..."
         cd $NODEFOLDER && $JAVA_HOME/bin/java -jar corda.jar \
           run-migration-scripts --app-schemas --core-schemas
         echo "Done DB Migration node ${NODE}..."
        else
         echo " Starting node ${NODE} in ${NODEFOLDER}..."
         cd $NODEFOLDER
         nohup $JAVA_HOME/bin/java -jar corda.jar --no-local-shell &
         echo "Done Starting node ${NODE}..."
      fi
done
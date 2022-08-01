#!/bin/bash

NODES="node1"
BASEFOLDER=$(pwd)
DELETENODE=0
CORDA_VERSION=4.9
while getopts ':h:n:d:x:' option; do
   case $option in
      h) # display Help
         echo "Eg. ./create-node.sh -n node1,node2 -d /mnt/linux-data/apps/corda/nodes"
         exit
         ;;
      n) # Enter a name
         NODES=($(echo "$OPTARG" | tr ',' '\n'))
         ;;
      d) # base folder
         BASEFOLDER=$OPTARG
         ;;
      x) # delete node
         DELETENODE=1
         ;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;
   esac
done
shift $(( OPTIND - 1 ))

if [ $DELETENODE -eq 1 ];
 then
   echo "Deleting Node $NODEFOLDER..."
   rm -rf $NODEFOLDER
   exit;
fi

if [ ! -f corda-tools-network-bootstrapper-${CORDA_VERSION}.jar ]; then 
   echo "Downloading corda-tools-network-bootstrapper-${CORDA_VERSION}.jar..."
   wget https://software.r3.com/artifactory/corda-releases/net/corda/corda-tools-network-bootstrapper/${CORDA_VERSION}/corda-tools-network-bootstrapper-4.9.jar
fi
if [ ! -f drivers/corda-shell-${CORDA_VERSION}.jar ]; then 
   echo "Downloading corda-shell-${CORDA_VERSION}.jar..."
   wget -P drivers https://software.r3.com/artifactory/corda-releases/net/corda/corda-shell/${CORDA_VERSION}/corda-shell-${CORDA_VERSION}.jar
fi
if [ ! -f drivers/postgresql-42.4.0.jar ]; then 
   echo "Downloading postgresql-42.4.0.jar..."
   wget -P drivers https://jdbc.postgresql.org/download/postgresql-42.4.0.jar
fi

for NODE in "${NODES[@]}"
   do
      echo " Creating node ${NODE}.."
      NODEFOLDER=$BASEFOLDER/$NODE
      echo "Creating node folder : $NODEFOLDER"
      mkdir $NODEFOLDER
      mkdir $NODEFOLDER/additional-node-infos   # Additional node infos to load into the network map cache, beyond what the network map server provides
      mkdir $NODEFOLDER/artemis                 # Stores buffered P2P messages
      mkdir $NODEFOLDER/brokers                 # Stores buffered RPC messages
      mkdir $NODEFOLDER/certificates            # The node's certificates
      mkdir $NODEFOLDER/cordapps                # The CorDapp JARs installed on the node
      mkdir $NODEFOLDER/drivers                 # Contains a Jolokia driver used to export JMX metrics, the node loads any additional JAR files from this directory at startup.
      mkdir $NODEFOLDER/logs                    # The node's logs
      #mkdir $NODEFOLDER/network-parameters      # The network parameters automatically downloaded from the network map server
      mkdir $NODEFOLDER/shell-commands          # Custom shell commands defined by the node owner
      #
      cp drivers/postgresql-*.jar $NODEFOLDER/drivers/
      cp drivers/corda-shell-${CORDA_VERSION}.jar $NODEFOLDER/drivers/
      #cp drivers/jolokia-jvm-1.6.0-agent.jar $NODEFOLDER/drivers/
      echo "Update certificates to include node..."
      echo "Done creating corda node folders..."  
done

echo "Bootstrapping network..."
$JAVA_HOME/bin/java -jar corda-tools-network-bootstrapper-${CORDA_VERSION}.jar --dir=$BASEFOLDER
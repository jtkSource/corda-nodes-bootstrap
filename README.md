# DEV Corda cluster

## Prepare the nodes

Run the below command to create the nodes gs,hsbc and mas specfied by the option `-n gs,hsbc,mas` 
The command expected the node config directory specified by the option `-d /mnt/linux-data/apps/corda/nodes` 

```shell
    ./create-node.sh -n gs,hsbc,citi,mas,cb,sgx -d /mnt/data/workspace/corda-nodes-bootstrap/nodes
```

Then node configs are of the format `gs_node.conf` where `gs` specifices the node give in the `-n` option

```shell
    nodes
    ├── gs_node.conf
    ├── hsbc_node.conf
    └── mas_node.conf

```

On running the command the required nodes folder are created under the same folder and bootsrapped 
The application is currently configured for postgreSQL DB
Ensure the sql commands of the respective nodes are executed before creating the nodes in `nodes-sql` folder


In case the app requires the schema to be updated first run with the below command
```
    ./start-node.sh -n mas,sgx,cb,gs,hsbc,citi -d /mnt/data/workspace/corda-nodes-bootstrap/nodes -m 1
```


## Run the nodes

On running the below command the mas node is started 

```shell
    ./start-node.sh -n mas,sgx,cb,gs,hsbc,citi -d /mnt/data/workspace/corda-nodes-bootstrap/nodes
``` 

The script copies any cordapp in the `cordapps` folder to all the nodes before starting the nodes

The process starts in the background with an embedded ssh server. 

You can login to the server using ssh

```shell
  #sgx - notary
  ssh -p 2213 localhost -l sgx
  #mas - observer
  ssh -p 2203 localhost -l corda
  #cb
  ssh -p 2211 localhost -l corda
  #gs
  ssh -p 2209 localhost -l corda
  #hsbc
  ssh -p 2206 localhost -l corda
  #citi
  ssh -p 2215 localhost -l corda

  p - port
  l - RPC user to login
```

## Commands

[node shell commands](https://docs.r3.com/en/platform/corda/4.9/community/shell.html#node-shell-commands)

### Shutdown

To shutdown the node, ssh into the node and run the below command

```shell
  run gracefulShutdown
  run shutdown
```

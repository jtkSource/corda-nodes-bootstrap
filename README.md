# DEV Corda cluster

## Prepare the nodes

    Run the below command to create the nodes gs,hsbc and mas specfied by the option `-n gs,hsbc,mas` 
    The command expected the node config directory specified by the option `-d /mnt/linux-data/apps/corda/nodes` 
    
    ```bash
        ./create-node.sh -n gs,hsbc,mas -d /mnt/linux-data/apps/corda/nodes
    ```

    Then node configs are of the format `gs_node.conf` where `gs` specifices the node give in the `-n` option

    ```
        nodes
        ├── gs_node.conf
        ├── hsbc_node.conf
        └── mas_node.conf

    ```

    On running the command the required nodes folder are created under the same folder and bootsrapped 
    The application is currently configured for postgreSQL DB
    Ensure the sql commands of the respective nodes are executed before creating the nodes in `nodes-sql` folder

## Run the nodes

    On running the below command the mas node is started 

    ```bash
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes
    ``` 

    The script copies any cordapp in the `cordapps` folder to all the nodes before starting the nodes
    
    In case the app requires the schema to be updated first run with the below commands
    ```bash
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes -m 1
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes
    ```

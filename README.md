# DEV Corda cluster

## Prepare the nodes

    Run the below command to create the nodes gs,hsbc and mas specfied by the option `-n gs,hsbc,mas` 
    The command expected the node config directory specified by the option `-d /mnt/linux-data/apps/corda/nodes` 
    
    ```
        ./create-node.sh -n gs,hsbc,citi,mas,cb,sgx -d /mnt/data/workspace/corda-nodes-bootstrap/nodes
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

    ```
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes
    ``` 

    The script copies any cordapp in the `cordapps` folder to all the nodes before starting the nodes
    
    In case the app requires the schema to be updated first run with the below commands
    ```
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes -m 1
        ./start-node.sh -n mas -d /mnt/linux-data/apps/corda/nodes
    ```

## Demo

The default setup of the nodes are as below:

- **Observer**
  This node keeps track of all assets on the network
  Its is the responsibility of the participating node to send notifications  to the observer when a new assets are being created / destroyed and/or payouts occur on the assets
  In our demo we have take the MAS as the observer

- **Notary**
  This node is responsible for notarizig all transaction and can perform extra validations
  on the transaction
  In our demo SGX is the notary node

- **Banks**
  These are nodes that participate in the buy/selling and creation of assets
  The banks configured are
  - Goldman Sachs
  - HSBC
- **Central Bank**
  This node is responsible for issuing digital currencies token and to uphold the value of the token against the fiat
  The main role of the Central bank is to hold collateral to various parties and issue currency tokens for the nodes to participate in sale of digital assets

```bash
  start CreateAndIssueTerm bondName: JTK, couponPaymentLeft: 100, interestRate: 5, purchasePrice: 250, unitsAvailable: 100, maturityDate: 20230810, bondType: GB, currency: SGD, creditRating: AAA

  start CreateAndIssueTerm bondName: FIRST-STREET, couponPaymentLeft: 100, interestRate: 6.7, purchasePrice: 34.5, unitsAvailable: 1000, maturityDate: 20250810, bondType: GB, currency: SGD, creditRating: AA+

```

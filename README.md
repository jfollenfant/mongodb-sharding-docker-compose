# mongodb-sharding-docker-compose

:whale: docker-compose stack that allows you to turn on a full MongoDB sharded cluster with the following components :

 * configserver replicaset: 3x mongod with configsrv enabled 
 * first replicaset shard: 3x mongod 
 * second replicaset shard: 3x mongod
 * third replicaset shard: 3x mongod
 * mongo query router: 1x mongos
 * authentication enabled + global auth key certificate between nodes

:warning: Of course this is for development purpose only  

    # Usage :
    $ git clone git@github.com:jfollenfant/mongodb-sharding-docker-compose.git
    $ mongodb-sharding-docker-compose
    $ ./up.sh
    
    
You can also edit mongo-auth.init.js to change admin credentials before turning up the cluster

    admin = db.getSiblingDB("admin")
    admin.createUser(
      {
         user: "admin",
         pwd: "admin",
         roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] 
      }
    )

:tropical_drink: Then you should be able to log into the cluster:

    $ docker exec -it mongodbdocker_mongo-router-01_1 mongo
    MongoDB shell version v3.4.2
    connecting to: mongodb://127.0.0.1:27017
    MongoDB server version: 3.4.2
    Welcome to the MongoDB shell.
    For interactive help, type "help".
    For more comprehensive documentation, see
         	http://docs.mongodb.org/
    Questions? Try the support group
        	http://groups.google.com/group/mongodb-user
    Server has startup warnings:
    2017-03-27T11:54:56.800+0000 I CONTROL  [main]
    2017-03-27T11:54:56.801+0000 I CONTROL  [main] ** WARNING: Access control is not enabled for the database.
    2017-03-27T11:54:56.801+0000 I CONTROL  [main] **          Read and write access to data and configuration is unrestricted.
    2017-03-27T11:54:56.801+0000 I CONTROL  [main]
    mongos>



:beer: And turn it down with:

    $ ./down.sh
    
    
   # TODO :construction:
   
  * Generate random data to populate shards through balancing 
  * Update compose syntax to v3 
  * Use swarm capabilities for production grade deployment 
  

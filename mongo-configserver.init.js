rs.initiate(
   {
      _id: "mongo-configserver",
      configsvr: true,
      version: 1,
      members: [
         { _id: 0, host : "mongo-configserver-01:27017" },
         { _id: 1, host : "mongo-configserver-02:27017" },
         { _id: 2, host : "mongo-configserver-03:27017" }
      ]
   }
)

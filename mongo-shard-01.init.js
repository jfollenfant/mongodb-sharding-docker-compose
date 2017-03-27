rs.initiate(
   {
      _id: "mongo-shard-01",
      version: 1,
      members: [
         { _id: 0, host : "mongo-shard-01a:27018" },
         { _id: 1, host : "mongo-shard-01b:27018" },
         { _id: 2, host : "mongo-shard-01c:27018" }
      ]
   }
)

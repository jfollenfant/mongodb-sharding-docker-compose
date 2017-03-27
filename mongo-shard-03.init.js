rs.initiate(
   {
      _id: "mongo-shard-03",
      version: 1,
      members: [
         { _id: 0, host : "mongo-shard-03a:27020" },
         { _id: 1, host : "mongo-shard-03b:27020" },
         { _id: 2, host : "mongo-shard-03c:27020" }
      ]
   }
)

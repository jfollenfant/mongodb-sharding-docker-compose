rs.initiate(
   {
      _id: "mongo-shard-02",
      version: 1,
      members: [
         { _id: 0, host : "mongo-shard-02a:27019" },
         { _id: 1, host : "mongo-shard-02b:27019" },
         { _id: 2, host : "mongo-shard-02c:27019" }
      ]
   }
)

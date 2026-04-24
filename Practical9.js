use abc_db

db.table_abc.drop()
db.createCollection("table_abc")

db.table_abc.insertMany([
  { item: "abc", cat: "xyz", qty: 12, val: 123 },
  { item: "abc", cat: "pqr", qty: 34, val: 345 },
  { item: "def", cat: "xyz", qty: 56, val: 567 },
  { item: "def", cat: "pqr", qty: 78, val: 789 }
])

db.table_abc.find().pretty()

db.table_abc.aggregate([
  {
    $group: {
      _id: "$cat",
      totalQty: { $sum: "$qty" },
      avgVal: { $avg: "$val" }
    }
  }
])

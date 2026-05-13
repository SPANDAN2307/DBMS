use abc_db

db.createCollection("table_abc")

db.table_abc.insertMany([
  { item: "abc", cat: "x", qty: 5, price: 100 },
  { item: "abc", cat: "y", qty: 15, price: 120 },
  { item: "xyz", cat: "x", qty: 10, price: 200 },
  { item: "xyz", cat: "y", qty: 8, price: 210 },
  { item: "pqr", cat: "z", qty: 4, price: 300 },
  { item: "pqr", cat: "x", qty: 20, price: 320 }
])

db.table_abc.aggregate([
  { $group: { _id: "$cat", totalQty: { $sum: "$qty" }, avgPrice: { $avg: "$price" } } }
])

db.table_abc.aggregate([
  { $group: { _id: "$item", totalSold: { $sum: "$qty" } } },
  { $match: { totalSold: { $gt: 12 } } }
])

db.table_abc.createIndex({ item: 1 })

db.table_abc.createIndex({ cat: 1, item: 1 })

db.table_abc.getIndexes()

db.table_abc.find({ item: "abc" }).explain("executionStats")

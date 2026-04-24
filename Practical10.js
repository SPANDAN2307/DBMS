use abc_db

db.table_abc.aggregate([
  { $group: { _id: "$item", totalSold: { $sum: "$qty" } } },
  { $match: { totalSold: { $gt: 12 } } }
])

db.table_abc.createIndex({ item: 1 })
db.table_abc.createIndex({ cat: 1, item: 1 })

db.table_abc.getIndexes()

db.table_abc.find({ item: "abc" }).explain("executionStats")

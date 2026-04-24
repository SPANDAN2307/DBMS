use mydb

db.sales.aggregate([
  { $group: { _id: "$product", totalSold: { $sum: "$quantity" } } },
  { $match: { totalSold: { $gt: 5 } } }
])

db.sales.createIndex({ product: 1 })
db.sales.createIndex({ region: 1, product: 1 })

db.sales.getIndexes()

db.sales.find({ product: "Laptop" }).explain("executionStats")

use store_db

db.createCollection("Inventory")

db.Inventory.insertMany([
  { product_name: "Laptop", category: "Electronics", stock: 50, unit_price: 1000 },
  { product_name: "Mouse", category: "Electronics", stock: 150, unit_price: 25 },
  { product_name: "Desk", category: "Furniture", stock: 20, unit_price: 200 },
  { product_name: "Chair", category: "Furniture", stock: 40, unit_price: 150 },
  { product_name: "Notebook", category: "Stationery", stock: 500, unit_price: 5 },
  { product_name: "Pen", category: "Stationery", stock: 1000, unit_price: 2 }
])

db.Inventory.aggregate([
  { $group: { _id: "$category", totalStock: { $sum: "$stock" }, avgPrice: { $avg: "$unit_price" } } }
])

db.Inventory.aggregate([
  { $group: { _id: "$product_name", totalStock: { $sum: "$stock" } } },
  { $match: { totalStock: { $gt: 100 } } }
])

db.Inventory.createIndex({ product_name: 1 })

db.Inventory.createIndex({ category: 1, product_name: 1 })

db.Inventory.getIndexes()

db.Inventory.find({ product_name: "Laptop" }).explain("executionStats")

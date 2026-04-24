use mydb

db.createCollection("sales")

// Sample data
db.sales.insertMany([
  { product: "Laptop", region: "North", quantity: 5, price: 60000 },
  { product: "Laptop", region: "South", quantity: 3, price: 62000 },
  { product: "Phone", region: "North", quantity: 10, price: 20000 },
  { product: "Phone", region: "South", quantity: 8, price: 21000 },
  { product: "Tablet", region: "East", quantity: 4, price: 30000 },
  { product: "Tablet", region: "West", quantity: 6, price: 32000 },
  { product: "Laptop", region: "East", quantity: 2, price: 61000 },
  { product: "Phone", region: "West", quantity: 12, price: 19000 }
])

// ----- AGGREGATION -----

// Total quantity and average price per region
db.sales.aggregate([
  { $group: {
      _id: "$region",
      totalQuantity: { $sum: "$quantity" },
      avgPrice: { $avg: "$price" },
      maxPrice: { $max: "$price" },
      minPrice: { $min: "$price" }
  }}
])

// Products with total quantity > 10 (like HAVING clause)
db.sales.aggregate([
  { $group: {
      _id: "$product",
      totalSold: { $sum: "$quantity" }
  }},
  { $match: { totalSold: { $gt: 10 } } }
])

// Count of sales per product per region
db.sales.aggregate([
  { $group: {
      _id: { product: "$product", region: "$region" },
      countSales: { $sum: 1 }
  }}
])

// ----- INDEXING -----

// Create index on product field
db.sales.createIndex({ product: 1 })

// Create compound index on region and product
db.sales.createIndex({ region: 1, product: 1 })

// Check existing indexes
db.sales.getIndexes()

// Query using index
db.sales.find({ product: "Laptop" }).explain("executionStats")

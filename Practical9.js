use mydb

db.sales.drop()
db.createCollection("sales")

db.sales.insertMany([
  { product: "Laptop", region: "North", quantity: 5, price: 60000 },
  { product: "Laptop", region: "South", quantity: 3, price: 62000 },
  { product: "Phone", region: "North", quantity: 10, price: 20000 },
  { product: "Phone", region: "South", quantity: 8, price: 21000 }
])

db.sales.find().pretty()

db.sales.aggregate([
  {
    $group: {
      _id: "$region",
      totalQuantity: { $sum: "$quantity" },
      avgPrice: { $avg: "$price" }
    }
  }
])

use library_db

db.Books.drop()

db.createCollection("Books")

db.Books.insertOne({ _id: 1, title: "The Great Gatsby", genre: "Fiction", pages: 218, price: 15 })

db.Books.insertMany([
  { _id: 2, title: "1984", genre: "Dystopian", pages: 328, price: 20 },
  { _id: 3, title: "Dune", genre: "Sci-Fi", pages: 412, price: 25 },
  { _id: 4, title: "Sapiens", genre: "History", pages: 498, price: 30 }
])

db.Books.save({ _id: 5, title: "Thinking, Fast and Slow", genre: "Psychology", pages: 499, price: 35 })

db.Books.find()

db.Books.find({ $or: [{ genre: "Sci-Fi" }, { pages: { $gt: 400 } }] })

db.Books.find({ $and: [{ genre: "Fiction" }, { pages: { $lt: 300 } }] })

db.Books.updateOne({ title: "The Great Gatsby" }, { $set: { pages: 220 } })

db.Books.updateMany({ genre: "Sci-Fi" }, { $inc: { price: 5 } })

db.Books.save({ _id: 1, title: "The Great Gatsby", genre: "Classic", pages: 220, price: 18 })

db.Books.deleteOne({ title: "1984" })

db.Books.deleteMany({ pages: { $gte: 450 } })

db.Books.find()

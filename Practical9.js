use abc_db

db.table_abc.drop()

db.createCollection("table_abc")

db.table_abc.insertOne({ _id: 1, item: "abc", cat: "xyz", qty: 10, val: 100 })

db.table_abc.insertMany([
  { _id: 2, item: "def", cat: "pqr", qty: 20, val: 200 },
  { _id: 3, item: "ghi", cat: "xyz", qty: 30, val: 300 },
  { _id: 4, item: "jkl", cat: "mno", qty: 40, val: 400 }
])

db.table_abc.save({ _id: 5, item: "stu", cat: "vwx", qty: 50, val: 500 })

db.table_abc.find()

db.table_abc.find({ $or: [{ cat: "xyz" }, { qty: { $gt: 30 } }] })

db.table_abc.find({ $and: [{ cat: "xyz" }, { qty: { $lt: 20 } }] })

db.table_abc.updateOne({ item: "abc" }, { $set: { qty: 15 } })

db.table_abc.updateMany({ cat: "xyz" }, { $inc: { val: 50 } })

db.table_abc.save({ _id: 1, item: "abc", cat: "xyz", qty: 25, val: 150 })

db.table_abc.deleteOne({ item: "def" })

db.table_abc.deleteMany({ qty: { $gte: 40 } })

db.table_abc.find()

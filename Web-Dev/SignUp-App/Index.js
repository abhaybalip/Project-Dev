const print = (data) => console.log(data)

const http = require('http')
const express = require('express')
const exp = require('constants')
const { mongoClient } = require('mongodb')

// mongodb database info :
const uri = "mongodb://localhost:27017/userData"
const dbName = "userData"
const collectionName = "user"
async function StoreData(data) {
    try {
        const client = await MongoClient.connect(uri, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        })

        const db = client.db(dbName)
        const collection = db.collection(collectionName);

        const result = await collection.insertOne(data)
        print(`Data Inserted to DB : ${result.insertedId}`);

    } catch (error) {
        print(`Error Occured : ${error}`)
    } finally {
        await client.close();
    }
}
const app = express()
app.use(express.static(__dirname + '/Asset'))
app.use(express.json())
app.use('/signup', function (req, res) {
    if (!req.errored) {
        if (req.method == 'GET') {
            res.sendFile(__dirname + '/Asset/Index.html')
        }
        else if (req.method == 'POST') {
            res.sendFile(__dirname + '/Asset/Thanks.html')

            data = req.body
            StoreData(data)
        }
    } else {
        res.send('Error Occured !')
    }
})

app.listen(1000, function (err) {
    print('server started !')
})
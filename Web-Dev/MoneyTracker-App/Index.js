const print = (data) => console.log(data)

const express = require('express')
const mongoose = require('mongoose')
const bodyParser = require('body-parser')

const app = express();

mongoose.connect('mongodb://localhost:27017/money-tracker', { useNewUrlParser: true })
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error(err))

const transactionSchema = new mongoose.Schema({
    type: String,
    amount: Number,
    description: String,
    createdAt: { type: Date, default: Date.now }
});
const Transaction = mongoose.model('Transaction', transactionSchema)

app.use(bodyParser.json())


app.get('/',async function (req, res) {
    try {
        const transactions = await Transaction.find()
        res.json(transactions)
    } catch (err) {
        console.error(err)
        res.status(500).send('Error retrieving transactions')
    }
})


app.post('/add-transaction', async (req, res) => {
    try {
        const transaction = new Transaction(req.body)
        const savedTransaction = await transaction.save()
        res.json(savedTransaction)
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding transaction')
    }
})

app.listen(1000, function (err) {
    if (err) print("Error :" + err)
    else print('server started')
})
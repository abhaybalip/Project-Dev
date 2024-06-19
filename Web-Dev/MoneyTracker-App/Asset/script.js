const transactionForm = document.getElementById('transaction-form');
const transactionsList = document.querySelector('#transactions ul');

transactionForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const data = new FormData(transactionForm);
    fetch('/add-transaction', {
        method: 'POST',
        body: data,
    })
        .then(response => response.json())
        .then(transaction => {
            const listItem = document.createElement('li');
            listItem.textContent = `${transaction.type}: ${transaction.amount} - ${transaction.description}`;
            transactionsList.appendChild(listItem);
            transactionForm.reset();
        })
        .catch(error => console.error(error));
});

fetch('/get-transactions')
    .then(response => response.json())
    .then(transactions => {
        transactions.forEach(transaction => {
            const listItem = document.createElement('li');
            listItem.textContent = `${transaction.type}: ${transaction.amount} - ${transaction.description}`;
            transactionsList.appendChild(listItem);
        });
    })
    .catch(error => console.error(error));

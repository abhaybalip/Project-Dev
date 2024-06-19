
function reset() {
    document.getElementById('ip-name').value = ''
    document.getElementById('ip-sname').value = ''
    document.getElementById('ip-age').value = '0'
    document.getElementById('ip-gen').value = 'select'

    console.log('form data reset !')
}

// function submit() {

//     var data = {
//         name: document.getElementById('ip-name').value,
//         sname: document.getElementById('ip-sname').value,
//         age: document.getElementById('ip-age').value,
//         gen: document.getElementById('ip-gen').value
//     }
//     data = JSON.stringify(data)
    
//     var res = fetch('/thanks',{
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: data
//     }).then(function(res){
//         console.log(res.status)
//         console.log(res.body)
//     })
// }
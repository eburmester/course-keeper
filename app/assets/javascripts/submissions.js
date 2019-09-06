
// function append(data) {
//   document.getElementById('submissions').appendChild(data)
// }

document.addEventListener('turbolinks:load', () => {
  let form = document.getElementById('new_submission') 
  form && form.addEventListener('submit', (event) => {
    event.preventDefault()
    let data = {submission: {}};
     data['submission']['content'] = event.target.querySelector('#submission_content').value;
     let token = event.target.querySelector('input[name=authenticity_token').value
     let subs = document.getElementById('submissions')
     myFetch(`${event.target.action}.json`,{
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-token': token
          },
          body: JSON.stringify(data)
        
        })
        
          .then(res=>res.json())
          .then(data => {
            debugger
            subs.append(data.content);
            event.target.querySelector("#submission_content").value = "";
            event.target.querySelector("[type=submit]").disabled = false
            }) 
    })
  })



  
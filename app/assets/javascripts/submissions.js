// class Submission {
//   constructor(attributes) {
//     this.id = attributes.id;
//     this.content = attributes.content;
//   }

//   renderSubs() {
//     return `
//     <div id="submissions">
//     <h1>Your Submissions:</h1>
//       <li>${this.submission.content}</li>
//     </div>
//     `
//   }
// }


document.addEventListener('turbolinks:load', () => {
  let form = document.getElementById('new_submission') 
  form && form.addEventListener('submit', (event) => {
    event.preventDefault()
    let data = {submission: {}};
     data['submission']['content'] = event.target.querySelector('#submission_content').value;
     let token = event.target.querySelector('input[name=authenticity_token').value
     
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
          .then(res=> console.log(res))
          debugger
    })
  })

  // const displaySubmissions = (results) => {
  //   let html = results.content
  //   document.getElementById('submissions').innerHTML = html
  // }



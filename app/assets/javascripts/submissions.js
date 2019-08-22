document.addEventListener('turbolinks:load', () => {
  let form = document.getElementById('new_submission') 
  form && form.addEventListener('submit', (event) => {
    event.preventDefault()
    $.ajax ({
      url: event.target.action,
      type: "POST",
      data: 
    debugger
  })
})


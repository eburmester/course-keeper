document.addEventListener('tubolinks:load', () => {
  let showAssignmentButon = document.getElementById('show-assignments')
  showAssignmentButon.addEventListener('click', (e) => {
    getAssignments(e.target.dataset.id)
      .then(res => res.json())
      .then(assignments => displayAssignments(assignments))
      .catch(err => displayError("This Course does not have any Assignments yet"))
  })
})

const displayAssignments = (results) => {
  let html = results.map(assignmentData => new Assignment(assignmentData).render()).join('')
  document.getElementById('assignments').innerHTML = html
}

const displayError = (error) => {
  document.getElementById('assignments').innerHTML = error;
}
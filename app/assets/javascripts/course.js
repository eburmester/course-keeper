document.addEventListener('turbolinks:load', () => {
  let showAssignmentButton = document.getElementById('show-assignments')
  showAssignmentButton.addEventListener('click', (e) => {
    getAssignments(e.target.dataset.id)
      .then(res => res.json())
      .then(assignments => displayAssignments(assignments))
      .catch(err => displayError("This Course does not have any Assignments yet"))
  })
})

const getAssignments = (courseId) => {
  return myFetch(`http://localhost:3000/courses/${courseId}/assignments.json`)
}

const displayAssignments = (results) => {
  let html = results.map(assignmentData => new Assignment(assignmentData).render()).join('')
  document.getElementById('assignments').innerHTML = html
}

const displayError = (error) => {
  document.getElementById('assignments').innerHTML = error;
}

class Assignment {
  constructor(attributes) {
    this.id = attributes.id;
    this.title = attributes.title;
    this.difficulty = attributes.difficulty;
    this.course_id = attributes.course_id;
    this.submission_id = attributes.submission_id;
  }

  render() {
    return `
      <div><a href="/courses/${this.course_id}/assignments/${this.id}">${this.title}</a></div>
    `
  }
}
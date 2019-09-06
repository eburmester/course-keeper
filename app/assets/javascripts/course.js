document.addEventListener('turbolinks:load', () => {
  let showAssignmentButton = document.getElementById('show-assignments')
  showAssignmentButton.addEventListener('click', (e) => {
    getAssignments(e.target.dataset.id)
      .then(res => res.json())
      .then(assignments => displayAssignments(assignments))
      .catch(err => displayError(err))
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
    this.user_id = attributes.user_id;
    this.submission_id = attributes.submission_id;
    this.submissions = attributes.submissions;
  }

  showAssignmentButton() {
    return `
    <button onclick="toggleSubmissions(${this.id})">Show Submissions</button>
    `
  }

 

  render() {
    return `
      <div>
        <a href="/courses/${this.course_id}/assignments/${this.id}">${this.title}</a>${this.showAssignmentButton()}
          <div data-subsid="${this.id}" class="dn" >${this.submissions.map(submissionData => new Submission(submissionData).render()).join('')}</div>
      </div>
      
    `
  }
  
  renderAssignments() {
    return `
      <div>
        <a href="/courses/${this.course_id}/assignments/${this.id}">${this.title}</a>
      </div>
      `
  }

}

function toggleSubmissions(id) {
    document.querySelector(`[data-subsid="${id}"]`).style.display="block"
}
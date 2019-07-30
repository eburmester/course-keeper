class Course {
  constructor(attributes) {
    this.id = attributes.id;
    this.title = attributes.title;
    this.description = attributes.description;
    this.created_on_pretty = attributes.created_on_pretty;
    this.created_by = attributes.created_by;
  }

  showCourseButton() {
    return `
    <button onclick="toggleShowCourse(${this.id})">${this.title}</button>
    `
  }
  render() {
    return `
    ${this.showCourseButton()}
    `
  }
}

document.addEventListener('turbolinks:load', () => {
  let showCourseButton = document.getElementById('show-course')
  showCourseButton.addEventListener('click', (e) => {
    getCourseShow(e.target.dataset.id)
      .then(res => res.json())
      .then(course => displayCourseShow(course))
      .catch(err => displayCourseShowError(err))
  })
})

const getCourseShow = (courseId) => {
  return myFetch(`http://localhost:3000/courses/${courseId}.json`)
}

const displayCourseShow = (results) => {
  let html = results.each(courseData => new Course(courseData).render())
  document.getElementById('show-course').innerHTML = html
}

const displayCourseShowError = (error) => {
  document.getElementById('show-course').innerHTML = error;
}

function toggleShowCourse(id) {
  document.querySelector(`[data-courseid="${id}]`).style.display="table-column"
}






























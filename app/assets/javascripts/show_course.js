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
    <button class="show-course"  onclick="toggleShowCourse(${this.id})">${this.title}</button>
    `
  }
  render() {
    return `
    ${this.showCourseButton()}
    `
  }

  renderShow() {
    return `
    
    <div data-courseid="${this.id}">
    <h1><${this.title}></h1>
      <h2><${this.description}></h2>
    </br>

    <button id="show-assignments" data-id="<${this.id}>">Show Assignments</button>
    <div id="assignments"></div>


    </br>
    </br>
      <a href="/courses/${this.id}/assignments/new >Create a New Assignment!</p>
    </br>
    </br>

    <p>Created On: <${created_on_pretty}></p>
    </div>
    `
  }
}

// const attachListeners = () => {
//   let showCourseButton = document.getElementById('show-course')
//   showCourseButton.addEventListener('click', (e) => {
//     getCourseShow(e.target.dataset.id)
//       .then(res => res.json())
//       .then(course => displayCourseShow(course))
//       .catch(err => displayCourseShowError(err))
//   })
// }

document.addEventListener('turbolinks:load', () => {
  getAllCourses()
    .then(res => res.json())
    .then(courses => displayCourseIndex(courses))
// need to add getCourseShow here? 
//  .then(course => displayCourseShow(course))
})

const getCourseShow = (courseId) => {
  return myFetch(`http://localhost:3000/courses/${courseId}.json`)
}

const getAllCourses = () => {
  return myFetch(`http://localhost:3000/courses.json`)
}

const displayCourseShow = (results) => {
  let html = new Course(results).renderShow()
  document.getElementById('courses').innerHTML = html
}

const displayCourseIndex = (results) => {
  let html = results.map(courseData => new Course(courseData).render()).join('')
  document.getElementById('courses').innerHTML = html
}

const displayCourseShowError = (error) => {
  document.getElementById('show-course').innerHTML = error;
}

function toggleShowCourse(id) {
  debugger
  document.querySelector(`[data-courseid="${id}]`).style.display="block"
}































class Course {
  constructor(attributes) {
    this.id = attributes.id;
    this.title = attributes.title;
    this.description = attributes.description;
    this.created_on_pretty = attributes.created_on_pretty;
    this.created_by = attributes.created_by;
    this.assignments = attributes.assignments;
  }

  

  showCourseButton() {
    return `
    <button class="show-course"  onclick="loadCourseShow(${this.id})">${this.title}</button>
    `
  }
  render() {
    return `
    ${this.showCourseButton()}
    `
  }

  

  renderShow() {
  
    return `
    
    <div>
    <h1>${this.title}</h1>
      <h2>${this.description}</h2>
  

    <a href="/courses/${this.id}/assignments" >Show Assignments</button>
    <div id="assignments"></div>


    </br>
    
      <a href="/courses/${this.id}/assignments/new" >Create a New Assignment!</p>
    
    

    
    </div>
    `
  }
}


document.addEventListener('turbolinks:load', () => {
  getAllCourses()
    .then(res => res.json())
    .then(courses => displayCourseIndex(courses))
// need to add getCourseShow here? 
//  .then(course => displayCourseShow(course))
})

const getCourseShow = (courseId) => {
  return myFetch(`/courses/${courseId}.json`)
}

const getAllCourses = () => {
  return myFetch(`/courses.json`)
}

const displayCourseShow = (results) => {
  let html = new Course(results).renderShow()
  document.getElementById('course-show').innerHTML = html
}

const displayCourseIndex = (results) => {
  let html = results.map(courseData => new Course(courseData).render()).join('')
  document.getElementById('courses').innerHTML = html
}

const displayCourseShowError = (error) => {
  document.getElementById('show-course').innerHTML = error;
}

const loadCourseShow = (id) => {
  getCourseShow(id)
    .then(res => res.json())
    .then(course => displayCourseShow(course))
}

const displayAssignments = (assignments) => {
  let assign = assignments.map(assignData => new Assignment(assignData))
}































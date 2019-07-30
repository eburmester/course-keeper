class Submission {
  constructor(attributes){
    this.id = attributes.id;
    this.content = attributes.content;
    this.assignment_id = attributes.assignment_id;
  }

  render() {
    return `
    <div>${this.content}</div>
    `
  }
}



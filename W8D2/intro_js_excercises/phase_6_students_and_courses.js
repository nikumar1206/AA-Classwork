function Student(first_name, last_name) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.courses = [];
}
Student.prototype.name = function() {
    return `${this.first_name} ${this.last_name}`
}

Student.prototype.hasconflict = function(course2) {
    this.courses.forEach(element => {
        if (element.conflictsWith(course2)) {
            return true
        }
    })
    return false
}
Student.prototype.enroll = function(course) {
    let course_list = this.courses
    if ((!course_list.includes(course)) && (!this.hasconflict(course)) ) {
        course_list.push(course)
    }
};

Student.prototype.courseLoad = function() {
    let course_hash = {}
    this.courses.forEach(course => {
        if (course.dept in course_hash) {
            course_hash[course.dept] += course.num_creds
        } else {
            course_hash[course.dept] = course.num_creds
        }
    });
    return course_hash
}

function Course(course_name, dept, num_creds, days, time_block) {
    this.course_name = course_name
    this.dept = dept
    this.num_creds = num_creds
    this.students = []
    this.days = days
    this.time_block = time_block

}

// Course.prototype.addStudent = function(student) {
//     if (!this.students.includes(student)) {
//         this.students.push(student)
//         student.enroll(this)
//     }
// }

// Course.prototype.conflictsWith = function(course2) {
//     this.days.forEach(day => {
//         if (course2.days.includes(day) && this.time_block === course2.time_block) {
//             return true // cannot return out of a FOREACH LOOP
//         }
//     })
//     return false
// }

Course.prototype.conflictsWith = function(other) {
    if (this.time_block !== other.time_block) return false;
    return this.days.some(day => other.days.includes(day));
}

let student1 = new Student("Nigel", "Leffler");
let course1 = new Course("101", "CS", 3, ["mon", "wed", "fri"], 1);
let course2 = new Course("201", "CS", 3, ["wed"], 1);
let course3 = new Course("301", "ENG", 3, ["tue"], 1);
let course4 = new Course("401", "BIO", 3, ["mon", "wed", "fri"], 2);
console.log(student1.name());
student1.enroll(course1);
student1.enroll(course3);
student1.enroll(course2);
console.log(student1.courseLoad());
console.log('should be true = ' + course1.conflictsWith(course2));
console.log('should be false = ' + course1.conflictsWith(course3));
console.log('should be false = ' + course1.conflictsWith(course4));
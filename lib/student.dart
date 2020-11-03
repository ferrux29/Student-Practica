class Student {
  int studentID;
  String lastName;
  String firstName;
  DateTime enrollmentDate;

  Student({this.studentID, this.lastName, this.firstName, this.enrollmentDate});

  Student.newStudent(
      int id, String lastname, String firstname, DateTime enrollmentdate) {
    this.studentID = id;
    this.lastName = lastname;
    this.firstName = firstname;
    this.enrollmentDate = enrollmentdate;
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentID: json['StudentID'],
      lastName: json['LastName'],
      firstName: json['FirstName'],
      enrollmentDate: DateTime.parse(json['EnrollmentDate']),
    );
  }
}

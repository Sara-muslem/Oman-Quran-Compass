import 'dart:io';
import 'dart:math';

enum CourseType { Tajweed, Tafseer, Tahfeedh, Tadabur }
enum Mode { Online, InPerson }

class Student {
  String _id;
  String _name;
  int _age;
  String _city;
  String _contact;

  Student(this._id, this._name, this._age, this._city, this._contact);

  String get id => _id;
  String get name => _name;
  int get age => _age;
  String get city => _city;
  String get contact => _contact;

  set name(String value) => _name = value;
  set age(int value) => _age = value;
  set city(String value) => _city = value;
  set contact(String value) => _contact = value;

  void display() {
    print('ID: $_id | Name: $_name | Age: $_age | City: $_city | Contact: $_contact');
  }
}

class Course {
  String _id;
  String _name;
  String _instructor;
  Mode _mode;
  CourseType _type;
  String _startDate;
  String _endDate;
  String _gender;
  int _minAge;
  String _description;
  String _prerequisites;

  Course(
      this._id,
      this._name,
      this._instructor,
      this._mode,
      this._type,
      this._startDate,
      this._endDate,
      this._gender,
      this._minAge,
      this._description,
      this._prerequisites,
      );

  String get id => _id;
  String get name => _name;
  String get instructor => _instructor;
  Mode get mode => _mode;
  CourseType get type => _type;
  String get startDate => _startDate;
  String get endDate => _endDate;
  String get gender => _gender;
  int get minAge => _minAge;
  String get description => _description;
  String get prerequisites => _prerequisites;

  set name(String val) => _name = val;
  set instructor(String val) => _instructor = val;
  set mode(Mode val) => _mode = val;
  set type(CourseType val) => _type = val;
  set startDate(String val) => _startDate = val;
  set endDate(String val) => _endDate = val;
  set gender(String val) => _gender = val;
  set minAge(int val) => _minAge = val;
  set description(String val) => _description = val;
  set prerequisites(String val) => _prerequisites = val;

  void display() {
    print('''
Course ID: $_id | Name: $_name
Instructor: $_instructor | Mode: ${_mode.name} | Type: ${_type.name}
Start: $_startDate | End: $_endDate | Gender: $_gender | Min Age: $_minAge
Description: $_description
Prerequisites: $_prerequisites
''');
  }
}

class School {
  String _id;
  String _name;
  String _location;

  School(this._id, this._name, this._location);

  String get id => _id;
  String get name => _name;
  String get location => _location;

  set name(String name) => _name = name;
  set location(String location) => _location = location;

  void display() {
    print('School ID: $_id | Name: $_name | Location: $_location');
  }
}

// Utility Functions
String generateID(String prefix) => '$prefix${Random().nextInt(900000) + 100000}';

void displayMenu() {
  print('''
===== COURSE MANAGEMENT MENU =====
1. Display All Students
2. Display All Courses
3. Add Student
4. Add Course
5. Update Course
6. Delete Course
7. Search Courses by Type
8. Exit
''');
}

void main() {
  List<Student> students = [];
  List<Course> courses = [];

  while (true) {
    displayMenu();
    stdout.write('Enter your choice: ');
    try {
      int choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          if (students.isEmpty) {
            print('No students found.');
          } else {
            students.forEach((s) => s.display());
          }
          break;

        case 2:
          if (courses.isEmpty) {
            print('No courses found.');
          } else {
            courses.forEach((c) => c.display());
          }
          break;

        case 3:
          stdout.write('Enter Name: ');
          String name = stdin.readLineSync()!;
          stdout.write('Enter Age: ');
          int age = int.parse(stdin.readLineSync()!);
          stdout.write('Enter City: ');
          String city = stdin.readLineSync()!;
          stdout.write('Enter Contact: ');
          String contact = stdin.readLineSync()!;
          String id = generateID('S');
          students.add(Student(id, name, age, city, contact));
          print('Student added successfully.');
          break;

        case 4:
          stdout.write('Course Name: ');
          String name = stdin.readLineSync()!;
          stdout.write('Instructor: ');
          String instructor = stdin.readLineSync()!;
          stdout.write('Delivery Mode (0=Online, 1=InPerson): ');
          Mode mode = Mode.values[int.parse(stdin.readLineSync()!)];
          stdout.write('Course Type (0=Tajweed, 1=Tafseer, 2=Tahfeedh, 3=Tadabur): ');
          CourseType type = CourseType.values[int.parse(stdin.readLineSync()!)];
          stdout.write('Start Date (dd/mm/yyyy): ');
          String start = stdin.readLineSync()!;
          stdout.write('End Date (dd/mm/yyyy): ');
          String end = stdin.readLineSync()!;
          stdout.write('Gender (Males/Females/Mix): ');
          String gender = stdin.readLineSync()!;
          stdout.write('Minimum Age: ');
          int age = int.parse(stdin.readLineSync()!);
          stdout.write('Course Description: ');
          String description = stdin.readLineSync()!;
          stdout.write('Prerequisites: ');
          String prerequisites = stdin.readLineSync()!;

          String id = generateID('C');
          courses.add(Course(id, name, instructor, mode, type, start, end, gender, age, description, prerequisites));
          print('Course added successfully.');
          break;

        case 5:
          stdout.write('Enter course ID to update: ');
          String id = stdin.readLineSync()!;
          Course? c;

          try {
            c = courses.firstWhere((course) => course.id == id);
          } catch (e) {
            c = null;
          }

          if (c != null) {
            stdout.write('New Name: ');
            c.name = stdin.readLineSync()!;
            stdout.write('New Instructor: ');
            c.instructor = stdin.readLineSync()!;
            stdout.write('New Start Date (dd/mm/yyyy): ');
            c.startDate = stdin.readLineSync()!;
            stdout.write('New End Date (dd/mm/yyyy): ');
            c.endDate = stdin.readLineSync()!;
            stdout.write('New Gender: ');
            c.gender = stdin.readLineSync()!;
            stdout.write('New Min Age: ');
            c.minAge = int.parse(stdin.readLineSync()!);
            stdout.write('New Description: ');
            c.description = stdin.readLineSync()!;
            stdout.write('New Prerequisites: ');
            c.prerequisites = stdin.readLineSync()!;
            print('Course updated successfully.');
          } else {
            print('Course not found.');
          }
          break;

        case 6:
          stdout.write('Enter Course ID to delete: ');
          String id = stdin.readLineSync()!;
          courses.removeWhere((c) => c.id == id);
          print('Deleted if course existed.');
          break;

        case 7:
          stdout.write('Enter Course Type to search (0=Tajweed, 1=Tafseer, 2=Tahfeedh, 3=Tadabur): ');
          CourseType type = CourseType.values[int.parse(stdin.readLineSync()!)];
          courses.where((c) => c.type == type).forEach((c) => c.display());
          break;

        case 8:
          print('Goodbye!');
          return;

        default:
          print('Invalid option.');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}

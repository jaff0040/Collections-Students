import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  // Map:
  void plus(Map<String, String> person) {
    people.add(person);
  }

  // Remove:
  void remove(String field) {
    people.removeWhere((person) =>
        person['first'] == field ||
        person['last'] == field ||
        person['email'] == field);
  }
}

void main() {
  String json = '''
  [
    {"first":"Tom", "last":"Jerry", "email":"Jerry@algonquincollege.com"},
    {"first":"Ali", "last":"Cool", "email":"Cool@algonquincollege.com"},
    {"first":"Mark", "last":"Adnan", "email":"Adnan@algonquincollege.com"},
    {"first":"Jack", "last":"Salman", "email":"Salman@algonquincollege.com"}
  ]
  ''';

  List<dynamic> peopleListDynamic = jsonDecode(json);
  List<Map<String, String>> peopleList =
      peopleListDynamic.map((item) => Map<String, String>.from(item)).toList();

  Students students = Students(peopleList);

  print("Initial list of students:");
  students.output();

  print("\nSorted by 'first' name:");
  students.sort('first');
  students.output();

  // Add new student:
  print("\nAfter adding a new student(Sayed):");
  students.plus({
    "first": "Sayed",
    "last": "Jaffar",
    "email": "sayed@algonquincollege.com"
  });
  students.output();

  print("\nAfter removing 'Ali':");
  students.remove('Ali');
  students.output();
}

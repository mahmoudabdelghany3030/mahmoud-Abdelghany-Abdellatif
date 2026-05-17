void main() {

  // ================= Part 1 =================

  Set<String> students = {
    "Ali",
    "Ahmed",
    "Mona",
  };

  addStudent(students, "Nour");

  print("Students Recursively:");
  printStudents(students.toList(), 0);

  print("\nStudents باستخدام Lambda:");

  students.forEach((student) {
    print(student);
  });

  Set<String> newStudents = {
    "Sara",
    "Omar",
  };

  Set<String> mergedStudents = {
    ...students,
    ...newStudents,
  };

  print("\nMerged Students:");

  mergedStudents.forEach((student) {
    print(student);
  });

  // ================= Part 2 =================

  Map<String, List<Map<String, double>>> studentCourses = {};

  addCourse(
    studentCourses,
    "Ali",
    "Math",
    grade: 90,
  );

  addCourse(
    studentCourses,
    "Ali",
    "Physics",
    grade: 80,
  );

  addCourse(
    studentCourses,
    "Ahmed",
    "Programming",
    grade: 95,
  );

  addCourse(
    studentCourses,
    "Ahmed",
    "Database",
    grade: 85,
  );

  print("\nAverage Grades:");

  print(
    "Ali Average = ${averageGrade(studentCourses, "Ali")}",
  );

  print(
    "Ahmed Average = ${averageGrade(studentCourses, "Ahmed")}",
  );
}

// ================= Functions Part 1 =================

void addStudent(
  Set<String> students,
  String name,
) {
  students.add(name);
}

void printStudents(
  List<String> students,
  int index,
) {
  if (index >= students.length) {
    return;
  }

  print(students[index]);

  printStudents(
    students,
    index + 1,
  );
}

// ================= Functions Part 2 =================

void addCourse(
  Map<String, List<Map<String, double>>> data,
  String studentName,
  String courseName, {
  double grade = 0,
}) {

  data.putIfAbsent(studentName, () => []);

  data[studentName]!.add({
    courseName: grade,
  });
}

double averageGrade(
  Map<String, List<Map<String, double>>> data,
  String studentName,
) {

  if (!data.containsKey(studentName)) {
    return 0;
  }

  List<Map<String, double>> courses =
      data[studentName]!;

  List<double> grades = [];

  courses.forEach((course) {
    grades.addAll(course.values);
  });

  double total =
      grades.reduce((a, b) => a + b);

  return total / grades.length;
}
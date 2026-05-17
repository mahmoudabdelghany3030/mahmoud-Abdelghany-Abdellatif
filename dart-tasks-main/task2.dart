import 'dart:io';

int getStudentsCount() {
  int? studentsCount;

  while (true) {
    studentsCount = int.tryParse(stdin.readLineSync() ?? "");

    if (studentsCount == null || studentsCount < 0) {
      print("Please enter a valid number");
    } else {
      break;
    }
  }

  return studentsCount;
}

void main() {
  print("Enter number of students");

  int studentsCount = getStudentsCount();

  List<String?> studentsNames = [];
  List<List<double>> studentsMarks = [];

  for (int studentIndex = 0; studentIndex < studentsCount; studentIndex++) {
    print("Enter name of student ${studentIndex + 1}");

    String? studentName = stdin.readLineSync();

    studentsNames.add(studentName);
  }

  for (int studentIndex = 0; studentIndex < studentsCount; studentIndex++) {
    print("---- Student: ${studentsNames[studentIndex]} ----");

    print("Enter number of subjects");

    int subjectsCount =
        int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    List<double> subjectMarks = [];

    print("Enter subjects grades");

    for (int subjectIndex = 0;
        subjectIndex < subjectsCount;
        subjectIndex++) {

      double mark =
          double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

      subjectMarks.add(mark);
    }

    studentsMarks.add(subjectMarks);
  }

  for (int studentIndex = 0;
      studentIndex < studentsCount;
      studentIndex++) {

    print("Student Name: ${studentsNames[studentIndex]}");

    double totalMarks = 0;

    for (int subjectIndex = 0;
        subjectIndex < studentsMarks[studentIndex].length;
        subjectIndex++) {

      totalMarks += studentsMarks[studentIndex][subjectIndex];
    }

    if (studentsMarks[studentIndex].isNotEmpty) {
      double average =
          totalMarks / studentsMarks[studentIndex].length;

      print("Average = $average");
    } else {
      print("No grades entered");
    }

    print("-------------------");
  }
}
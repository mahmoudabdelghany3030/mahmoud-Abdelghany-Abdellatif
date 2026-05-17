import 'dart:io';

void main() {
  String? userInput = stdin.readLineSync();

  if (userInput != null) {
    int degree = int.parse(userInput);

    if (degree >= 95 && degree <= 100) {
      print('A+');
    } else if (degree >= 90 && degree < 95) {
      print('A');
    } else if (degree >= 85 && degree < 90) {
      print('B+');
    } else if (degree >= 80 && degree < 85) {
      print('B');
    } else if (degree >= 75 && degree < 80) {
      print('C+');
    } else if (degree >= 70 && degree < 75) {
      print('C');
    } else if (degree >= 65 && degree < 70) {
      print('D+');
    } else if (degree >= 60 && degree < 65) {
      print('D');
    } else if (degree < 60) {
      print('F');
    } else {
      print('Invalid Degree');
    }
  }
}
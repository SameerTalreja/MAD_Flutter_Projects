import 'dart:io';

void main() {
  stdout.write("Enter your age: ");
  String? input = stdin.readLineSync();

  try {
    if (input == null || input.isEmpty) {
      throw FormatException("Input cannot be empty.");
    }

    int age = int.parse(input);

    if (age < 0) {
      throw FormatException("Age cannot be negative.");
    }

    int yearsLeft = 100 - age;
    if (yearsLeft > 0) {
      print("You have $yearsLeft years left until you turn 100.");
    } else {
      print("You are already 100 or older!");
    }
  } catch (e) {
    print("Invalid input: ${e.toString()}");
  }
}

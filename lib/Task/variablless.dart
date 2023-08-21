// ignore_for_file: avoid_print, avoid_init_to_null, prefer_const_declarations

import 'package:flutter/material.dart';

class VAriabless extends StatefulWidget {
  const VAriabless({super.key});

  @override
  State<VAriabless> createState() => _VAriablessState();
}

class _VAriablessState extends State<VAriabless> {
  @override
  Widget build(BuildContext context) {
    // Integer variable
    int age = 22;
    print('int = $age');

    // Double variable
    double height = 1.75;
    print('double = $height');

    // String variable
    String name = "Rahul Patil";
    print('String = $name');

    // Boolean variable
    bool isStudent = true;
    print('bool = $isStudent');

    // Dynamic variable
    dynamic dynamicVariable = "Hello";
    print('dynamic = $dynamicVariable');

    // Final and Const variables
    final int finalNumber = 10;
    print('final int = $finalNumber');

    const String constText = "This is a constant";
    print('const String = $constText');

    // List and Map variables
    List<String> fruits = ['Apple', 'Banana', 'Orange'];
    print('List<String> = $fruits');

    Map<String, int> ages = {
      'John': 30,
      'Jane': 28,
      'Bob': 35,
    };
    print('Map<String, int> = $ages');

    // Null safety variable
    int? nullableValue = null;
    print('Nullable int? = $nullableValue');

    // Late initialized variable
    late String lateInitializedVariable;
    lateInitializedVariable = "Initialized now";
    print('Late initialized String = $lateInitializedVariable');

    print('\n----------------------------------------------------------------');
    // Examples of interchanging values with type conversion while keeping the type the same
    String stringValue = "505";
    double doubleValue = 3.14;

    // String to int
    int intValueFromString = int.parse(stringValue);
    print('String to int: $intValueFromString');

    // String to double
    double doubleValueFromString = double.parse(stringValue);
    print('String to double: $doubleValueFromString');

    // String to final (final value cannot be changed)
    final finalString = stringValue;
    print('String to final: $finalString');

    // int to String int value is 22 is geting from age
    String stringValueFromInt = age.toString();
    print('int to String: $stringValueFromInt');

    // int to double int value is 22 is geting from age
    double doubleValueFromInt = age.toDouble();
    print('int to double: $doubleValueFromInt');

    // int to final (final value cannot be changed)
    final finalInt = age;
    print('int to final: $finalInt');

    // double to String|| double value is 1.75 is geting from height
    String stringValueFromDouble = height.toString();
    print('double to String: $stringValueFromDouble');

    // double to int (rounding down to the nearest integer)|| double value is 1.75 is geting from height
    int intValueFromDouble = height.toInt();
    print('double to int: $intValueFromDouble');

    // double to final (final value cannot be changed)||double value is 1.75 is geting from height
    final finalDouble = height;
    print('double to final: $finalDouble');

    // Late initialized variable
    lateInitializedVariable = "Initialized now";
    print('Late initialized String = $lateInitializedVariable');

    return Scaffold(
      appBar: AppBar(
        title: Text("Variables"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Name(String): $name'),
            Text('Age(int): $age'),
            Text('Height(double): $height'),
            Text('Is Student?(Boolean) $isStudent'),
            Text('Dynamic Variable: $dynamicVariable'),
            Text('Final Number: $finalNumber'),
            Text('Constant Text: $constText'),
            Text('Fruits(List): ${fruits.join(", ")}'),
            Text('Ages(Map): ${ages.toString()}'),
            Text('Nullable Value: $nullableValue'),
            ElevatedButton(
              onPressed: () {
                print('Late Variable: $lateInitializedVariable');
              },
              child: Text('Print Late Variable'),
            ),
          ],
        ),
      ),
    );
  }
}

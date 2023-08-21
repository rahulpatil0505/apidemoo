import 'package:flutter/material.dart';

class demodatatypes extends StatefulWidget {
  const demodatatypes({super.key});

  @override
  State<demodatatypes> createState() => _demodatatypesState();
}

class _demodatatypesState extends State<demodatatypes> {
  @override
  Widget build(BuildContext context) {
    int myNumber = 42;
    double myDecimal = 3.14;
    String message = "Hello, From Rahul!";
    bool isFlutterAwesome = true;
    List<int> numbers = [1, 2, 3, 4, 5];
    Map<String, int> scores = {'Rahul': 95, 'Shivam': 88, 'Kartik': 75};
    Set<String> uniqueNames = {'Rahul', 'Mohit', 'Shivam', 'Kartik'};
    dynamic myVar = 42;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Types"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('int: $myNumber'),
            Text('double: $myDecimal'),
            Text('String: $message'),
            Text('bool: $isFlutterAwesome'),
            Text('List: $numbers'),
            Text('Map: $scores'),
            Text('Set: $uniqueNames'),
            Text('dynamic: $myVar'),
          ],
        ),
      ),
    );
  }
}

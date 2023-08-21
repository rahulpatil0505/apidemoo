import 'package:flutter/material.dart';

class Operatorss extends StatefulWidget {
  const Operatorss({super.key});

  @override
  State<Operatorss> createState() => _OperatorssState();
}

class _OperatorssState extends State<Operatorss> {
  @override
  Widget build(BuildContext context) {
    // Arithmetic Operators
    int a = 10;
    int b = 5;
    int sum = a + b;
    int difference = a - b;
    int product = a * b;
    double quotient = a / b;
    int remainder = a % b;

    // Assignment Operators
    int x = 20;
    x += 5;
    int y = 10;
    y *= 3;

    // Relational Operators
    int p = 7;
    int q = 3;
    bool isEqual = p == q;
    bool isNotEqual = p != q;
    bool isGreater = p > q;
    bool isLess = p < q;
    bool isGreaterOrEqual = p >= q;
    bool isLessOrEqual = p <= q;

    // Logical Operators
    bool isTrue = true;
    bool isFalse = false;
    bool logicalAnd = isTrue && isFalse;
    bool logicalOr = isTrue || isFalse;
    bool logicalNot = !isTrue;

    // Bitwise Operator
    int num1 = 5; // 0101 in binary
    int num2 = 3; // 0011 in binary
    int bitwiseAnd = num1 & num2; // 0001
    int bitwiseOr = num1 | num2; // 0111
    int bitwiseXor = num1 ^ num2; // 0110
    int bitwiseNot = ~num1; // 1010

    // Conditional Operator
    int age = 18;
    String status = (age >= 18) ? 'Adult' : 'Minor';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Operators'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Arithmetic Operators:'),
              Text('Sum: $sum'),
              Text('Difference: $difference'),
              Text('Product: $product'),
              Text('Quotient: $quotient'),
              Text('Remainder: $remainder'),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Assignment Operators:'),
              Text('x += 5: $x'),
              Text('y *= 3: $y'),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Relational Operators:'),
              Text('Is Equal: $isEqual'),
              Text('Is Not Equal: $isNotEqual'),
              Text('Is Greater: $isGreater'),
              Text('Is Less: $isLess'),
              Text('Is Greater or Equal: $isGreaterOrEqual'),
              Text('Is Less or Equal: $isLessOrEqual'),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Logical Operators:'),
              Text('Logical AND: $logicalAnd'),
              Text('Logical OR: $logicalOr'),
              Text('Logical NOT: $logicalNot'),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Bitwise Operator:'),
              Text('Bitwise AND: $bitwiseAnd'),
              Text('Bitwise OR: $bitwiseOr'),
              Text('Bitwise XOR: $bitwiseXor'),
              Text('Bitwise NOT: $bitwiseNot'),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              const Text('Conditional Operator:'),
              Text('Status: $status'),
              const SizedBox(height: 10),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                thickness: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class alertttt extends StatelessWidget {
  String img;
  alertttt({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image.network(
            img,
            width: 250,
            height: 250,
          )
        ],
      ),
    );
  }
}

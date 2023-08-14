import 'package:apidemoo/api1/home.dart';
import 'package:apidemoo/api2/product.dart';
import 'package:apidemoo/api3/photodemo.dart';
import 'package:apidemoo/api4/user.dart';
import 'package:flutter/material.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Point'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeAPI(),
                      ));
                },
                child: Text('Flop')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Productdemo(),
                      ));
                },
                child: Text('Product')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoApi(),
                      ));
                },
                child: Text('Photo Api')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserdemoApi(),
                      ));
                },
                child: Text('User Api'))
          ],
        ),
      ),
    );
  }
}

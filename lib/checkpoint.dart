import 'package:apidemoo/APIS/clinik/clinik.dart';
import 'package:apidemoo/Task/enumm.dart';
import 'package:apidemoo/Task/opratorrs.dart';
import 'package:flutter/material.dart';

import 'APIS/api2/product.dart';
import 'APIS/api3/photodemo.dart';
import 'APIS/api4/user.dart';
import 'APIS/api5/home.dart';
import 'APIS/api6/product.dart';
import 'APIS/api7/countrydata.dart';
import 'APIS/api8/show.dart';
import 'APIS/headersAP/screen.dart';
import 'Task/dartdataType.dart';
import 'Task/variablless.dart';

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
        title: const Text('Check Point'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Productdemo(),
                      ));
                },
                child: const Text('Product')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoApi(),
                      ));
                },
                child: const Text('Photo Api')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserdemoApi(),
                      ));
                },
                child: const Text('User Api')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home3(),
                      ));
                },
                child: const Text('Photo Api')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Products2(),
                      ));
                },
                child: const Text('Product CMP')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowCountries(),
                      ));
                },
                child: const Text('Country')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Usersdemo(),
                      ));
                },
                child: const Text('UserDemo')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const demodatatypes(),
                      ));
                },
                child: const Text('DataTypes')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VAriabless(),
                      ));
                },
                child: const Text('Variables')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Operatorss(),
                      ));
                },
                child: const Text('Operators')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnummmEXAMPLE(),
                      ));
                },
                child: const Text('Enum')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClinikDemo(),
                      ));
                },
                child: const Text('Clinik')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BacksScreen(),
                      ));
                },
                child: const Text('Headers-API')),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

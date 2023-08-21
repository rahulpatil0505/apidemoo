import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  bool isLoading = false;
  // 1) create list empty list for storing api data use model class
  List<Photos> apiphoto = [];

  // 2) Create Future for featch data fromn api
  Future<List> getData() async {
    //3) one final variable for geting data from api
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    // 4) another variable for store data from api
    var data = jsonDecode(response.body);
    // 5) use for loop for store data in list one by one
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        apiphoto.add(Photos.fromJson(index));
      }
      return apiphoto;
    } else {
      return apiphoto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: apiphoto.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(apiphoto[index].title.toString()),
                      subtitle: Text(apiphoto[index].id.toString()),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(apiphoto[index].url.toString()),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

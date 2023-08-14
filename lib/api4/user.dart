import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

import 'usermodel.dart';

class UserdemoApi extends StatefulWidget {
  const UserdemoApi({super.key});

  @override
  State<UserdemoApi> createState() => _UserdemoApiState();
}

class _UserdemoApiState extends State<UserdemoApi> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        print(['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blueGrey.shade200,
                            elevation: 5.0,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "User Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                  ),
                                  ReuseOfRow(
                                      title: 'id',
                                      value:
                                          snapshot.data![index].id.toString()),
                                  ReuseOfRow(
                                      title: 'name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'username',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'email',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'phone',
                                      value: snapshot.data![index].phone
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'website',
                                      value: snapshot.data![index].website
                                          .toString()),
                                  const Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                  ),
                                  ReuseOfRow(
                                      title: 'adress',
                                      value: snapshot.data![index].address
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'city',
                                      value: snapshot.data![index].address!.city
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'lat',
                                      value: snapshot
                                          .data![index].address!.geo!.lat
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'lan',
                                      value: snapshot
                                          .data![index].address!.geo!.lng
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'street',
                                      value: snapshot
                                          .data![index].address!.street
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'zipcode',
                                      value: snapshot
                                          .data![index].address!.zipcode
                                          .toString()),
                                  const Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Company Details",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                  ),
                                  ReuseOfRow(
                                      title: 'company',
                                      value: snapshot.data![index].company
                                          .toString()),
                                  ReuseOfRow(
                                      title: 'name',
                                      value: snapshot.data![index].company!.name
                                          .toString()),
                                  // ReuseOfRow(
                                  //     title: 'catchphase',
                                  //     value: snapshot
                                  //         .data![index].company!.catchPhrase
                                  //         .toString()),
                                  ReuseOfRow(
                                      title: 'bs',
                                      value: snapshot.data![index].company!.bs
                                          .toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                })
          ],
        ),
      ),
    );
  }
}

class ReuseOfRow extends StatelessWidget {
  String title, value;

  ReuseOfRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(value,
              softWrap: false,
              style: const TextStyle(
                  fontSize: 15, overflow: TextOverflow.ellipsis)),
        )
      ],
    );
  }
}

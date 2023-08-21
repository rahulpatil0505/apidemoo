import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'clinikmode.dart';

class ClinikDemo extends StatefulWidget {
  const ClinikDemo({super.key});

  @override
  State<ClinikDemo> createState() => _ClinikDemoState();
}

class _ClinikDemoState extends State<ClinikDemo> {
  @override
  Widget build(BuildContext context) {
    Future<Usersdata?> getclinik() async {
      try {
        String clink = "https://dummyjson.com/users";
        http.Response res = await http.get(Uri.parse(clink));
        if (res.statusCode == 200) {
          return Usersdata.fromJson(jsonDecode(res.body));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      return null;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Clinik"),
        ),
        body: FutureBuilder(
          future: getclinik(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              final apidata = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: apidata.users!.length,
                itemBuilder: (context, index) {
                  final data = apidata.users![index];
                  return Card(
                    child: Column(children: [
                      Container(
                        child: Column(
                          children: [
                            const Text(
                              "User Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Divider(
                              thickness: 3,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data.image.toString()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Name: ${data.firstName.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(" ${data.maidenName.toString()}",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                                Text(" ${data.lastName.toString()}",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis))
                              ],
                            ),
                            const Divider(
                              thickness: 4,
                              color: Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Gender: ${data.gender.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text("DOB: ${data.birthDate.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text("BD: ${data.bloodGroup.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text("Height: ${data.height.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text("weight: ${data.weight.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Phone: ${data.phone.toString()}",
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Text("Email: ${data.email.toString()}",
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Text(
                                            "UserName : ${data.username.toString()}",
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Text("UserID: ${data.id.toString()}",
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 3,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Address: ${data.address!.address.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "City: ${data.address!.city.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "PS: ${data.address!.postalCode.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "State: ${data.address!.state.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis))
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text('Company Profile',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "Name: ${data.company!.name.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "Title: ${data.company!.title.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "Department: ${data.company!.department.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "Address : ${data.company!.address.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "City: ${data.company!.address!.city.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "PS: ${data.company!.address!.postalCode.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                      Text(
                                          "State: ${data.company!.address!.state.toString()}",
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      )
                      // ListTile(
                      //   title: Text(data.username.toString()),
                      //   subtitle: Text(data.address!.address.toString()),
                      //   trailing: Text('Age: ${data.age}'),
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(data.image.toString()),
                      //   ),
                      // )
                    ]),
                  );
                },
              );
            }
          },
        ));
  }
}

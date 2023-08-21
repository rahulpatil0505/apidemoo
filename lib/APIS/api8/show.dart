import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'automodel.dart';

class Usersdemo extends StatefulWidget {
  const Usersdemo({super.key});

  @override
  State<Usersdemo> createState() => _UsersdemoState();
}

class _UsersdemoState extends State<Usersdemo> {
  // Future<List<User>> fetchUser() async {
  //   final response = await http.get(Uri.parse('https://api.github.com/users'));
  //   print(response.body);

  //   List fetcheddata = jsonDecode(response.body.toString());
  //   List<User> userList = createUserList(fetcheddata);
  //   return userList;
  // }

  // List<User> createUserList(List data) {
  //   List<User> list = [];

  //   for (int i = 0; i < data.length; i++) {
  //     String title = data[i]["login"];
  //     int id = data[i]["id"];
  //     String node = data[i]["node_id"];
  //     String avtar = data[i]["avatar_url"];
  //     String type = data[i]['type'];
  //     User movie =
  //         User(name: title, id: id, avtarUrl: avtar, nodeId: node, type: type);
  //     list.add(movie);
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    Future<List<Userdata>> fetchUserDataList() async {
      try {
        final apiLink = 'https://api.github.com/users';
        final response = await http.get(Uri.parse(apiLink));
        if (response.statusCode == 200) {
          final List<dynamic> responseData = jsonDecode(response.body);
          final List<Userdata> userDataList =
              responseData.map((json) => Userdata.fromJson(json)).toList();
          return userDataList;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      return [];
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
        ),
        body: FutureBuilder<List<Userdata>>(
          future: fetchUserDataList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              final userDataList = snapshot.data!;
              return ListView.builder(
                itemCount: userDataList.length,
                itemBuilder: (context, index) {
                  final userData = userDataList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData.id.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                userData.login.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                userData.nodeId.toString(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.greenAccent[400],
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                        userData.avatarUrl.toString(),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text("TYPE : ${userData.type}")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            }
          },
        ));
  }
}
          


//  ListView.builder(

//                   itemCount: snapshot.data.id;
//                   itemBuilder: (context, index) {
//                     return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Card(
//                             elevation: 3.0,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     snapshot.data![index].id.toString(),
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   Text(
//                                     snapshot.data![index].name,
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   Text(
//                                     snapshot.data![index].nodeId,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         CircleAvatar(
//                                             backgroundColor:
//                                                 Colors.greenAccent[400],
//                                             radius: 40,
//                                             backgroundImage: NetworkImage(
//                                                 snapshot
//                                                     .data![index].avtarUrl)),
//                                         const Spacer(),
//                                         Text(
//                                             "TYPE : ${snapshot.data![index].type}")
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const Divider()
//                         ]);
//                   });

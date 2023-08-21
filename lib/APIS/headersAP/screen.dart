import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class BacksScreen extends StatefulWidget {
  const BacksScreen({super.key});

  @override
  State<BacksScreen> createState() => _BacksScreenState();
}

class _BacksScreenState extends State<BacksScreen> {
  static const String apikey =
      "c266d3bd2emsheb0a647a706d4b1p1c08aajsn0294b8155dd5";
  static const String apiHost = 'omgvamp-hearthstone-v1.p.rapidapi.com';

  static Future<List<Backs>> fetchBacks() async {
    final response = await http.get(Uri.https(apiHost, '/cardbacks'),
        headers: {'X-RapidAPI-key': apikey, 'X-RapidAPI-Host': apiHost});

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      List<Backs> backs = [];

      for (var item in data) {
        final name = item['name'] ?? '';
        final description = item['description'] ?? '';
        final img = item['img'] ?? '';

        backs.add(Backs(name: name, img: img, description: description));
        print(backs);
      }
      return backs;
    } else {
      throw Exception("Failde to Fetch Backs");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Container(
        child: FutureBuilder<List<Backs>>(
          future: fetchBacks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data![index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.data![index].img),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            snapshot.data![index].description,
                          ),
                          // CircleAvatar()
                          const Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

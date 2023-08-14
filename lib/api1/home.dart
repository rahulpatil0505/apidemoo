import 'dart:convert';

import 'package:apidemoo/api1/shortmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeAPI extends StatefulWidget {
  const HomeAPI({super.key});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  bool _isloding = true;

  Welcome? datafromAPI;
  _getData() async {
    try {
      String url = "https://app.quicktype.io/";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        datafromAPI = Welcome.fromJson(jsonDecode(res.body));
        _isloding = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API Demo'),
        ),
        body: _isloding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: datafromAPI!.greeting.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [Text(datafromAPI!.greeting[index].toString())],
                  );
                },
              ));
  }
}

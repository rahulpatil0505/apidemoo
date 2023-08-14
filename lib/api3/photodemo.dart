import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PhotoApi extends StatefulWidget {
  const PhotoApi({super.key});

  @override
  State<PhotoApi> createState() => _PhotoApiState();
}

class _PhotoApiState extends State<PhotoApi> {
  List _loadedphotos = [];
  Future<void> _fetchdata() async {
    const PhotoUrl = 'https://jsonplaceholder.typicode.com/photos';
    HttpClient client = HttpClient();
    client.autoUncompress = true;

    final HttpClientRequest request = await client.getUrl(Uri.parse(PhotoUrl));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=uTF-8");
    final HttpClientResponse response = await request.close();

    final String content = await response.transform(utf8.decoder).join();
    final List data = jsonDecode(content);
    setState(() {
      _loadedphotos = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Photo Api'),
        ),
        body: SafeArea(
            child: _loadedphotos.isEmpty
                ? Center(
                    child: ElevatedButton(
                        onPressed: () {
                          _fetchdata();
                        },
                        child: Text('Load Photos')),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          _loadedphotos[index]['thumbnailUrl'],
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        title: Text(_loadedphotos[index]['title']),
                        subtitle: Text(_loadedphotos[index]['id'].toString()),
                      );
                    },
                  )));
  }
}

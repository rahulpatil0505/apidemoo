import 'dart:convert';

import 'package:apidemoo/api2/alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dataModel.dart';

class Productdemo extends StatefulWidget {
  const Productdemo({super.key});

  @override
  State<Productdemo> createState() => _ProductdemoState();
}

class _ProductdemoState extends State<Productdemo> {
  bool _Isloding = false;

  DataModel? datafromApi;
  _getData() async {
    try {
      String ApiUrl = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(ApiUrl));
      if (res.statusCode == 200) {
        datafromApi = DataModel.fromJson(jsonDecode(res.body));
        _Isloding = false;
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
          title: Text('Product API'),
        ),
        body: _Isloding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: datafromApi!.products.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        datafromApi!.products[index].title
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.red,
                                          ))
                                    ]),
                                content: Image.network(
                                  datafromApi!.products[index].thumbnail,
                                  width: 100,
                                  height: 100,
                                ),
                              );
                            },
                          );
                          print('Tap');
                        },
                        child: Image.network(
                          datafromApi!.products[index].thumbnail,
                          width: 100,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          datafromApi!.products[index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                          ' Price : ${datafromApi!.products[index].price.toString()}')
                    ],
                  );
                },
              ));
  }
}

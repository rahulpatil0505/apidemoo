import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class Products2 extends StatefulWidget {
  const Products2({super.key});

  @override
  State<Products2> createState() => _Products2State();
}

class _Products2State extends State<Products2> {
  Future<Product?> fetchData() async {
    try {
      String apiLink = 'https://dummyjson.com/products';
      http.Response response = await http.get(Uri.parse(apiLink));
      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  // bool isloading = false;

  // //Step 1- create variable for not null modelclass
  // Product? apidata;
  // //Step 2- create function with async
  // fetchdata() async {
  //   //Step 3- Use Try cathc for get response from api
  //   try {
  //     //Step 4- variable for api link
  //     String apilink = 'https://dummyjson.com/products';
  //     //Step 5- create response from api
  //     http.Response response = await http.get(Uri.parse(apilink));
  //     // Step 6- use if else for json to body
  //     if (response.statusCode == 200) {
  //       apidata = Product.fromJson(jsonDecode(response.body));
  //       // isloading = false;
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchdata();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<Product?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Error fetching data"));
          } else {
            final apidata = snapshot.data!;
            return ListView.builder(
              itemCount: apidata.products!.length,
              itemBuilder: (context, index) {
                final data = apidata.products![index];
                return Card(
                  child: Column(
                    children: [
                      Text(data.title ?? 'No title'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: (data.images ?? []).map((e) {
                          return Container(
                            width: 50,
                            height: 50,
                            child: Image.network(e),
                          );
                        }).toList(),
                      ),
                      Text(
                        data.price.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),

      // body: isloading
      //     ? const Center(child: Text("Loading Data"))
      //     : apidata == null || apidata!.products == null
      //         ? const Center(child: Text("No data available"))
      //         : ListView.builder(
      //             itemCount: apidata!.products!.length,
      //             itemBuilder: (context, index) {
      //               final data = apidata!.products![index];
      //               return Card(
      //                 child: Column(
      //                   children: [
      //                     Text(data.title ?? 'No title'),
      //                     Row(
      //                       mainAxisSize: MainAxisSize.min,
      //                       children: (data.images ?? []).map((e) {
      //                         return Container(
      //                           width: 50,
      //                           height: 50,
      //                           child: Image.network(e),
      //                         );
      //                       }).toList(),
      //                     ),
      //                     Text(
      //                       data.price.toString(),
      //                       style: TextStyle(
      //                           fontSize: 18, fontWeight: FontWeight.bold),
      //                     )
      //                   ],
      //                 ),
      //               );
      //             },
      //           ),
    );
  }
}

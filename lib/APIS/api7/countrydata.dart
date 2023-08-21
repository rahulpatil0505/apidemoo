import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countryModel.dart';

class ShowCountries extends StatefulWidget {
  const ShowCountries({super.key});

  @override
  State<ShowCountries> createState() => _ShowCountriesState();
}

class _ShowCountriesState extends State<ShowCountries> {
  bool Isloading = false;

  CountryData? apidata;

  getCountryData() async {
    try {
      String clink = "https://api.globalgarner.org/api/user/countries";

      http.Response respose = await http.get(Uri.parse(clink));
      if (respose.statusCode == 200) {
        apidata = CountryData.fromJson(jsonDecode(respose.body));

        print("added");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Country Data'),
        ),
        body: Isloading
            ? const Center(child: Text("Loading Data"))
            : apidata == null || apidata!.data!.countries == null
                ? const Center(child: Text("No data available"))
                : ListView.builder(
                    itemCount: apidata!.data!.countries!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(apidata!.data!.countries![index].name
                                .toString()),
                            Text(apidata!.data!.countries![index].currencyName
                                .toString()),
                            SizedBox(
                              height: 25,
                              width: 90,
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Text(apidata!.data!.countries![index].id
                                    .toString()),
                              ),
                            ),
                            Text(apidata!.data!.countries![index].region
                                .toString())
                          ],
                        ),
                      );
                    },
                  ));
  }
}

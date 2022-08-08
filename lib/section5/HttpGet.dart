import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myHttp;

class HomePageGET extends StatefulWidget {
  const HomePageGET({Key? key}) : super(key: key);

  @override
  State<HomePageGET> createState() => _HomePageGETState();
}

class _HomePageGETState extends State<HomePageGET> {
  late String id, email, name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ID $id"),
            Text("Name $name"),
            Text("Email $email"),
            ElevatedButton(
                onPressed: () async {
                  var response = await myHttp.get(
                    Uri.parse("https://reqres.in/api/users/2"),
                  );
                  if (response.statusCode == 200) {
                    print("DATA BERHASIL");
                    Map<String, dynamic> dataJson =
                        json.decode(response.body) as Map<String, dynamic>;
                    setState(() {
                      id = dataJson["data"]["id"].toString();
                      name =
                          "${dataJson["data"]["first_name"].toString()} ${dataJson["data"]["last_name"].toString()}";
                      email = dataJson["data"]["email"].toString();
                    });
                  } else {
                    print("ERROR ${response.statusCode}");
                  }
                },
                child: const Text("Get Data"))
          ],
        ),
      ),
    );
  }
}

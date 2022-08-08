import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BelajarGetData extends StatelessWidget {
  const BelajarGetData({Key? key}) : super(key: key);

  final String apiUrl = "https://reqres.in/api/users?per_page=200";

  Future<List<dynamic>> _fetchDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(result.body);
    return json.decode(result.body)["data"];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Get HTTP"),
      ),
      body: Container(
          child: FutureBuilder<List<dynamic>>(
              future: _fetchDataUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(snapshot.data[index]["avatar"]),
                          ),
                          title: Text(snapshot.data[index]["first_name"] +
                              " " +
                              snapshot.data[index]["last_name"]),
                          subtitle: Text(snapshot.data[index]["email"]),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}

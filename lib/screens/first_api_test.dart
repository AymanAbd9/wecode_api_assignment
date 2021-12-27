import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const routeName = "/first_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('first api test'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text('title of $index '  + snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

Future<List<dynamic>> getPosts() async {
  String theUrl = "https://jsonplaceholder.typicode.com/posts";

  // wait and revieve a response from the endpoint
  http.Response response = await http.get(Uri.parse(theUrl));

  // decode the json body to a list<dynamic>
  List decodedJson = jsonDecode(response.body);

  // return a list of strings from the list<dynamic> we had
  return decodedJson.map((e) => e["title"]).toList();
}

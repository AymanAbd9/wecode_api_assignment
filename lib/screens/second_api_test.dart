import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  static const routeName = "/second_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second api test'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: getEmailsFromComments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text('email $index ' + snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

Future<List<dynamic>> getEmailsFromComments() async {
  String theUrl = "https://jsonplaceholder.typicode.com/comments";

  // wait and revieve a response from the endpoint
  http.Response response = await http.get(Uri.parse(theUrl));

  // decode the json body to a list<dynamic>
  List decodedJson = jsonDecode(response.body);

  // return a list of strings from the list<dynamic> we had
  return decodedJson.map((e) => e["email"]).toList();
}

// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/Model/user_model.dart';

// ignore: must_be_immutable
class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getFetchApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body.toString());
    // List<dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // userList.clear();
      for (Map<String, dynamic> index in data) {
        userList.add(UserModel.fromJson(index));
      }
      return userList;
    } else {
      // throw Exception("Failed To Load Data");
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        // leadingWidth: 10,
        centerTitle: true,
        // leading: const Icon(Icons.api),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
        title: const Text(
          'Example Three',
          style: TextStyle(
            color: Colors.white70,
            // fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: getFetchApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // return const Center(
                  //   child: Text(
                  //     "Loading...",
                  //     style: TextStyle(
                  //         color: Colors.deepPurple,
                  //         fontSize: 50,
                  //         fontWeight: FontWeight.w900),
                  //   ),
                  // );
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const Text('Name : '),
                              //     Text(snapshot.data![index].name.toString()),
                              //   ],
                              // ),
                              ResuableRow(
                                title: 'ID : ',
                                value: snapshot.data![index].id.toString(),
                              ),
                              ResuableRow(
                                title: 'Name : ',
                                value: snapshot.data![index].name.toString(),
                              ),
                              ResuableRow(
                                title: 'UserName : ',
                                value:
                                    snapshot.data![index].username.toString(),
                              ),
                              ResuableRow(
                                title: 'Email : ',
                                value: snapshot.data![index].email.toString(),
                              ),
                              ResuableRow(
                                title: 'Address : ',
                                value: snapshot.data![index].address!.street
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].address!.suite
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].address!.city
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].address!.zipcode
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].address!.geo!.lat
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].address!.geo!.lng
                                        .toString(),
                              ),
                              ResuableRow(
                                title: 'Phone : ',
                                value: snapshot.data![index].phone.toString(),
                              ),
                              ResuableRow(
                                title: 'WebSite : ',
                                value: snapshot.data![index].website.toString(),
                              ),
                              ResuableRow(
                                title: 'Company : ',
                                value: snapshot.data![index].company!.name
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].company!.catchPhrase
                                        .toString() +
                                    '\n' +
                                    snapshot.data![index].company!.bs
                                        .toString(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ResuableRow extends StatelessWidget {
  // const ResuableRow({super.key});
  // int? id;
  // String? name;
  // String? username;
  // String? email;
  // Address? address;
  // String? phone;
  // String? website;
  // Company? company;
  String title, value;

  ResuableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),

          // Text(snapshot.data![index].name.toString()),
        ],
      ),
    );
  }
}

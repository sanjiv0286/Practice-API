import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  // ignore: prefer_typing_uninitialized_variables
  static var data;

  Future<void> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(
        response.body.toString(),
      );
    } else {
      throw Exception('Failed To Load Data');
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
          'Example Four',
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
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                // if (!snapshot.hasData)
                {
                  return const CircularProgressIndicator.adaptive();
                  // return const Center(
                  //   child: Text(
                  //     "Loading...",
                  //     style: TextStyle(
                  //         color: Colors.deepPurple,
                  //         fontSize: 50,
                  //         fontWeight: FontWeight.w900),
                  //   ),
                  // );
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ReusbaleRow(
                                  title: 'ID : ',
                                  value: data[index]['id'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Name',
                                  value: data[index]['name'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Username',
                                  value: data[index]['username'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Email',
                                  value: data[index]['email'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'address',
                                  value: data[index]['address']['street']
                                      .toString(),
                                ),
                                ReusbaleRow(
                                  title: 'suite',
                                  value: data[index]['address']['suite']
                                      .toString(),
                                ),
                                ReusbaleRow(
                                  title: 'City',
                                  value:
                                      data[index]['address']['city'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'ZipCode',
                                  value: data[index]['address']['zipcode']
                                      .toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Lat',
                                  value: data[index]['address']['geo']['lat']
                                      .toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Lng',
                                  value: data[index]['address']['geo']['lng']
                                      .toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Phone',
                                  value: data[index]['phone'].toString(),
                                ),
                                ReusbaleRow(
                                  title: 'Website',
                                  value: data[index]['website'].toString(),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ReusbaleRow(
                                    title: 'Company',
                                    value: data[index]['company'].toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

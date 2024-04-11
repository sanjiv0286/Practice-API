import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/Model/post_model.dart';

// ignore: must_be_immutable
class ExampleOne extends StatelessWidget {
  List<PostsModel> postList = [];

  ExampleOne({super.key});

  Future<List<PostsModel>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    // List<dynamic> dataList = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // postList.clear();//************* */
      for (Map<String, dynamic> index in data) {
        postList.add(PostsModel.fromJson(index));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        // leadingWidth: 10,
        centerTitle: true,
        // leading: const Icon(Icons.api),

        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
        title: const Text(
          'Example One',
          style: TextStyle(
            color: Colors.white70,
            // fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  // if (!snapshot.hasData) {
                  //   // return const Center(
                  //   //   child: Text(
                  //   //     "Loading...",
                  //   //     style: TextStyle(
                  //   //         color: Colors.deepPurple,
                  //   //         fontSize: 50,
                  //   //         fontWeight: FontWeight.w900),
                  //   //   ),
                  //   // );
                  //   return const Center(child: CircularProgressIndicator());
                  // }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        // *****************************
                        // return Text(index.toString());
                        // ***************************
                        // return Text(postList[index].title.toString());
                        // ***************************

                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Card(
                            // padding : EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'UserId : ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        postList[index].userId.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Id : ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // const SizedBox(
                                      //   height: 3,
                                      // ),
                                      Text(
                                        postList[index].id.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  const Text(
                                    'Title : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Text(
                                    postList[index].title.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  const Text(
                                    'Description : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Text(
                                    'Description\n${postList[index].body}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 4,
                                  ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// *************************************************************************

// import 'dart:convert';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // void main() {
// //   runApp(const APiCall());
// // }
// void main() async {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const APiCall(),
//     ),
//   );
// }

// class APiCall extends StatelessWidget {
//   const APiCall({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('APiCall')),
//         body: const FetchApi(),
//       ),
//     );
//   }
// }

// class FetchApi extends StatefulWidget {
//   const FetchApi({super.key});

//   @override
//   State<FetchApi> createState() => _FetchApiState();
// }

// class _FetchApiState extends State<FetchApi> {
//   List<Model> model = [];
//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_unnecessary_containers
//     return FutureBuilder(
//       future: getData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//               itemCount: model.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                     // margin: const EdgeInsets.all(10),
//                     height: 250,
//                     color: Colors.green,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'User Id : ${model[index].userId}',
//                           style: const TextStyle(color: Colors.white),
//                           maxLines: 1,
//                         ),
//                         Text(
//                           'Id : ${model[index].id}',
//                           style: const TextStyle(color: Colors.white),
//                           maxLines: 1,
//                         ),
//                         Text(
//                           'Title : ${model[index].title}',
//                           style: const TextStyle(color: Colors.white),
//                           maxLines: 2,
//                         ),
//                         Text(
//                           'Body : ${model[index].body}',
//                           style: const TextStyle(color: Colors.white),
//                           maxLines: 3,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         } else if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         //  else if (snapshot.hasError) {
//         //   return Center(child: Text('Error: ${snapshot.error}'));
//         // }
//         else {
//           // Return a default widget if none of the conditions above are met
//           return const Center(child: Text('No data available'));
//         }
//       },
//     );
//   }

//   Future<List<Model>> getData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map<String, dynamic> index in data) {
//         model.add(Model.fromJson(index));
//       }
//       return model;
//     } else {
//       return model;
//     }
//   }
// }

// class Model {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   Model({this.userId, this.id, this.title, this.body});

//   Model.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['userId'] = userId;
//     data['id'] = id;
//     data['title'] = title;
//     data['body'] = body;
//     return data;
//   }
// }

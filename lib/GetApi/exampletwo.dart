import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ExampleTwo extends StatelessWidget {
  List<Photos> photoList = [];

  ExampleTwo({Key? key}) : super(key: key);

  Future<List<Photos>> getPostApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    List<dynamic> dataList = jsonDecode(response.body);

    if (response.statusCode == 200) {
      photoList.clear();

      // var data = JsonDecode(response.body.toString());
      for (Map i in dataList) {
        Photos photos = Photos(
          albumId: i['albumId'],
          id: i['id'],
          title: i['title'],
          url: i['url'],
          thumbnailUrl: i['thumbnailUrl'],
        );
        photoList.add(photos);
      }
      return photoList;
    } else {
      // throw Exception('Failed To Load Data');
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        // leadingWidth: 10,
        centerTitle: true,
        // leading: const Icon(Icons.api),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
        title: const Text(
          'Example Two',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 50,
                          fontWeight: FontWeight.w900),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: photoList.length,
                    itemBuilder: (context, index) {
                      // ****************************
                      // return Text(index.toString());
                      // ****************************
                      // return Text(photoList[index].title.toString());
                      // ****************************
                      // return ListTile(
                      //   // title: Text("Sanjiv Kushwaha"),
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(
                      //         snapshot.data![index].url.toString()),
                      //   ),
                      //   title: Text('Notes Id : ${snapshot.data![index].id}'),
                      //   subtitle: Text(snapshot.data![index].title.toString()+"\n"+Text('Album Id : ${snapshot.data![index].id}'),),
                      //   isThreeLine : true,//Text('Album Id : ${snapshot.data![index].id}'),
                      // );
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        // selected: true,
                        // leading: const Icon(Icons.person),
                        trailing: const Icon(Icons.star),
                        enabled: true,
                        onTap: () {},
                        onLongPress: () {},
                        // tileColor: Colors.greenAccent,
                        selectedTileColor: Colors.blue,
                        selectedColor: Colors.blue,
                        title: Text(
                          'Notes Id: ${snapshot.data![index].id}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   'Album Id:',
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            Text(
                              "Album Id : ${snapshot.data![index].albumId}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // const Text(
                            //   'Title : ',
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // Text(snapshot.data![index].title.toString()),
                            Text(
                              "Title : ${snapshot.data![index].title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const Text(
                              "Thumbnail : \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                snapshot.data![index].thumbnailUrl.toString(),
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      );
                    },
                  );
                }
              },
            ),
          ),
          // ******************************************
          // Expanded(
          //   flex: 2,
          //   child: FutureBuilder(
          //     future: getPostApi(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return const Center(
          //           child: Text(
          //             "Loading...",
          //             style: TextStyle(
          //                 color: Colors.deepPurple,
          //                 fontSize: 50,
          //                 fontWeight: FontWeight.w900),
          //           ),
          //         );
          //       } else {
          //         return ListView.builder(
          //           itemCount: photoList.length,
          //           itemBuilder: (context, index) {
          //             // ****************************
          //             // return Text(index.toString());
          //             // ****************************
          //             // return Text(photoList[index].title.toString());
          //             // ****************************
          //             return const ListTile(
          //               title: Text("Gaurish Ojha"),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
          // ******************************************
        ],
      ),
    );
  }
}

class Photos {
  int? albumId, id;
  String? title, url, thumbnailUrl;
  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
}

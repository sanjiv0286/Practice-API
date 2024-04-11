// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:practice/Model/product_model.dart';
// import 'package:http/http.dart' as http;

// class ExampleFive extends StatefulWidget {
//   const ExampleFive({super.key});

//   @override
//   State<ExampleFive> createState() => ExampleFiveState();
// }

// class ExampleFiveState extends State<ExampleFive> {
//   Future<ProductsModel> getfetchapi() async {
//     final response = await http.get(
//         Uri.parse('https://webhook.site/f803278a-fdad-4f11-b011-f59ae209a32e'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       return ProductsModel.fromJson(data);
//     } else {
//       return ProductsModel();
//       // throw Exception("Failed to Load Data");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         // leadingWidth: 10,
//         centerTitle: true,
//         leading: const Icon(Icons.api),
//         title: const Text(
//           'API Course',
//           style: TextStyle(
//             color: Colors.white70,
//             // fontSize: 50,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           FutureBuilder(
//             future: getfetchapi(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(
//                   child: Text(
//                     "Loading...",
//                     style: TextStyle(
//                         color: Colors.deepPurple,
//                         fontSize: 50,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 );
//                 // return const CircularProgressIndicator.adaptive();
//               } else {
//                 // return ListView.builder(
//                 //   itemCount: snapshot.data!.products![index].images.length,
//                 //   itemBuilder: (context, index) {

// // ignore_for_file: library_private_types_in_public_api

//                 //   },
//                 // );
//                 return ListView.builder(
//                     itemCount: snapshot.data!.products!.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: MediaQuery.of(context).size.height * .3,
//                             width: MediaQuery.of(context).size.width * 1,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                   // Fetch the first image URL from the list
//                                   snapshot.data!.products![index].images![0],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     });
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
// *******************************************************************************

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleFive(),
    );
  }
}

class ExampleFive extends StatefulWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  ExampleFiveState createState() => ExampleFiveState();
}

class ExampleFiveState extends State<ExampleFive> {
  Future<List<String>> _fetchImages() async {
    final response = await http.get(Uri.parse(
        'https://webhook.site/f803278a-fdad-4f11-b011-f59ae209a32e')); // Your API endpoint here
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['products'];
      List<String> imageList = [];
      for (var item in data) {
        List<dynamic> images = item['images'];
        imageList.addAll(images.cast<String>());
      }
      return imageList;
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Images'),
      ),
      body: FutureBuilder<List<String>>(
        future: _fetchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<String>? images = snapshot.data;
            return images != null && images.isNotEmpty
                ? ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Image.network(images[index]),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('No images found.'),
                  );
          }
        },
      ),
    );
  }
}

// ***************************************************************

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:practice/Model/product_model.dart';

// class ExampleFive extends StatefulWidget {
//   const ExampleFive({super.key});

//   @override
//   ExampleFiveState createState() => ExampleFiveState();
// }

// class ExampleFiveState extends State<ExampleFive> {
//   late Future<ProductsModel> futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = fetchProducts();
//   }

//   Future<ProductsModel> fetchProducts() async {
//     final response = await http.get(
//         Uri.parse('https://webhook.site/f803278a-fdad-4f11-b011-f59ae209a32e'));

//     if (response.statusCode == 200) {
//       return ProductsModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Products'),
//       ),
//       body: Center(
//         child: FutureBuilder<ProductsModel>(
//           future: futureProducts,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.products!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(snapshot.data!.products![index].title!),
//                     subtitle: Text(
//                         'Price: \$${snapshot.data!.products![index].price.toString()}'),
//                     leading: Image.network(
//                         snapshot.data!.products![index].images![0]),
//                     onTap: () {
//                       // Handle onTap
//                     },
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             // By default, show a loading spinner
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }

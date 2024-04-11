import 'package:flutter/material.dart';
import 'package:practice/screens/home_screen.dart';
// import 'package:practice/screens/get_api_screen.dart';
// import 'package:practice/GetApi/exampleone.dart';
// import 'package:practice/GetApi/exampleone.dart';
// import 'package:practice/GetApi/exampletwo.dart';
// import 'package:practice/GetApi/examplethree.dart';
// import 'package:practice/GetApi/examplefour.dart';
// import 'package:practice/GetApi/examplefive.dart';
// import 'package:practice/screens/practice.dart';

void main() {
  runApp(const MyApp());
}

// void main() async {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomScreen(),
      // home: GetApiTutorials(),
      // home: ExampleOne(),
      // home: APiCall(),
      // home: ExampleTwo(),
      // home: ExampleThree(),
      // home: ExampleFour(),
      // home: ExampleFive(),
      // home: Practice(),
    );
  }
}

// *************************************************************************

// !*****************************Fetch data *************************
// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const ApiFetchApp());
// }

// class ApiFetchApp extends StatefulWidget {
//   const ApiFetchApp({super.key});

//   @override
//   _ApiFetchAppState createState() => _ApiFetchAppState();
// }

// class _ApiFetchAppState extends State<ApiFetchApp> {
//   List<dynamic> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = jsonDecode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('API Fetch App'),
//         ),
//         body: _data.isEmpty
//             ? const Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_data[index]['title']),
//                     subtitle: Text(_data[index]['body']),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
// *********************************************************************
// ************************Fetch and post data **************************************
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const ApiPostApp());
// }

// class ApiPostApp extends StatefulWidget {
//   const ApiPostApp({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ApiPostAppState createState() => _ApiPostAppState();
// }

// class _ApiPostAppState extends State<ApiPostApp> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   List<dynamic> _data = [];
//   bool _isPosting = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = jsonDecode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   Future<void> postData(String title, String body) async {
//     setState(() {
//       _isPosting = true;
//     });

//     final response = await http.post(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//       body: jsonEncode(<String, String>{
//         'title': title,
//         'body': body,
//         'userId': '1', // Assuming a default userId
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 201) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       setState(() {
//         _data.add(responseData);
//         _isPosting = false;
//       });
//     } else {
//       throw Exception('Failed to post data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('API Post App'),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _bodyController,
//                 decoration: const InputDecoration(
//                   labelText: 'Body',
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_titleController.text.isNotEmpty &&
//                     _bodyController.text.isNotEmpty) {
//                   postData(_titleController.text, _bodyController.text);
//                 }
//               },
//               child: const Text('Post Data'),
//             ),
//             if (_isPosting)
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: CircularProgressIndicator(),
//               ),
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   await fetchData();
//                 },
//                 child: ListView.builder(
//                   itemCount: _data.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_data[index]['title']),
//                       subtitle: Text(_data[index]['body']),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// **********************************************************************************************************fetch and update data************************************

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const ApiUpdateApp());
// }

// class ApiUpdateApp extends StatefulWidget {
//   const ApiUpdateApp({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ApiUpdateAppState createState() => _ApiUpdateAppState();
// }

// class _ApiUpdateAppState extends State<ApiUpdateApp> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   late int _selectedItemId;
//   List<dynamic> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = jsonDecode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   Future<void> updateData(String title, String body) async {
//     final response = await http.put(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts/$_selectedItemId'),
//       body: jsonEncode(<String, String>{
//         'id': '$_selectedItemId',
//         'title': title,
//         'body': body,
//         'userId': '1', // Assuming a default userId
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       setState(() {
//         // Update the data list with the updated item
//         _data[_selectedItemId - 1] = responseData;
//       });
//     } else {
//       throw Exception('Failed to update data');
//     }
//   }

//   void selectItem(int id) {
//     setState(() {
//       _selectedItemId = id;
//       _titleController.text = _data[id - 1]['title'];
//       _bodyController.text = _data[id - 1]['body'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('API Update App'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_data[index]['title']),
//                     subtitle: Text(_data[index]['body']),
//                     onTap: () => selectItem(_data[index]['id']),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _bodyController,
//                 decoration: const InputDecoration(
//                   labelText: 'Body',
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_titleController.text.isNotEmpty &&
//                     _bodyController.text.isNotEmpty) {
//                   updateData(_titleController.text, _bodyController.text);
//                 }
//               },
//               child: const Text('Update Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// *************************fetch post and update*********************************

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const NotesApp());
// }

// class NotesApp extends StatefulWidget {
//   const NotesApp({super.key});

//   @override
//   NotesAppState createState() => NotesAppState();
// }

// class NotesAppState extends State<NotesApp> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   late int _selectedItemId;
//   List<dynamic> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = jsonDecode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   Future<void> postData(String title, String body) async {
//     final response = await http.post(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//       body: jsonEncode(<String, String>{
//         'title': title,
//         'body': body,
//         'userId': '1', // Assuming a default userId
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 201) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       setState(() {
//         _data.add(responseData);
//       });
//     } else {
//       throw Exception('Failed to post data');
//     }
//   }

//   Future<void> updateData(String title, String body) async {
//     final response = await http.put(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts/$_selectedItemId'),
//       body: jsonEncode(<String, String>{
//         'id': '$_selectedItemId',
//         'title': title,
//         'body': body,
//         'userId': '1', // Assuming a default userId
//       }),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       setState(() {
//         _data[_selectedItemId - 1] = responseData;
//       });
//     } else {
//       throw Exception('Failed to update data');
//     }
//   }

//   void selectItem(int id) {
//     setState(() {
//       _selectedItemId = id;
//       _titleController.text = _data[id - 1]['title'];
//       _bodyController.text = _data[id - 1]['body'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('API CRUD App'),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(
//                   labelText: 'Title',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _bodyController,
//                 decoration: const InputDecoration(
//                   labelText: 'Body',
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_titleController.text.isNotEmpty &&
//                         _bodyController.text.isNotEmpty) {
//                       postData(_titleController.text, _bodyController.text);
//                     }
//                   },
//                   child: const Text('Post Data'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_titleController.text.isNotEmpty &&
//                         _bodyController.text.isNotEmpty) {
//                       updateData(_titleController.text, _bodyController.text);
//                     }
//                   },
//                   child: const Text('Update Data'),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_data[index]['title']),
//                     subtitle: Text(_data[index]['body']),
//                     onTap: () => selectItem(_data[index]['id']),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// *********************************************************************

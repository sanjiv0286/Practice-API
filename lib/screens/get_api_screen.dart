import 'package:flutter/material.dart';
import 'package:practice/GetApi/examplefive.dart';
import 'package:practice/GetApi/examplefour.dart';
import 'package:practice/GetApi/exampleone.dart';
import 'package:practice/GetApi/examplethree.dart';
import 'package:practice/GetApi/exampletwo.dart';

class GetApiTutorials extends StatefulWidget {
  const GetApiTutorials({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GetApiTutorialsState createState() => _GetApiTutorialsState();
}

class _GetApiTutorialsState extends State<GetApiTutorials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Get API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ReusableWidget(
              title: 'Example one',
              subTitle:
                  'Example one where we create model using Plugin,click to see the source code',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExampleOne()));
              },
            ),
            ReusableWidget(
              title: 'Example Two',
              subTitle: 'Example one where we create our own custom model',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExampleTwo()));
              },
            ),
            ReusableWidget(
              title: 'Example Three',
              subTitle:
                  'Example four with complex JSON but we used plugins to create model and parse JSON data.',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleThree()));
              },
            ),
            ReusableWidget(
              title: 'Example Four',
              subTitle:
                  "Example four where we don't used model to fetch data from server and show in our api. Then we will use this method to fetch api",
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleFour()));
              },
            ),
            ReusableWidget(
              title: 'Example Five',
              subTitle:
                  'Example five, how to parse very complex JSON and show in api',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleFive()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusableWidget extends StatelessWidget {
  late String title, subTitle;
  final VoidCallback onPress;

  ReusableWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          child: Text('G'),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

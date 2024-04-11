import 'package:flutter/material.dart';
import 'package:practice/GetApi/drop_down_api.dart';
import 'package:practice/PostApi/post_api_screen.dart';
import 'package:practice/screens/get_api_screen.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  HomScreenState createState() => HomScreenState();
}

class HomScreenState extends State<HomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Practice API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetApiTutorials()));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text('G'),
                ),
                title: Text(
                  'Get APIs ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  " 1. What are Get APIS\n "
                  "2. What are different scenarios to handle Get API\n "
                  "3. Integrate Get APIS  Plugins Model and shows data into List\n "
                  "4. Integrate Get APIS  your own Model and show data into List\n "
                  "5. Integrate Get APIS  without Model and show data into List\n "
                  "6. Very Complex JSON practical Example",
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostApiScreen()));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text('P'),
                ),
                title: Text(
                  'Post APIs ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                    'Integration of post apis with example and with different scenario.'),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DropDownApi()));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Text('D'),
                ),
                title: Text(
                  'Drop Down',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('Loading data from api into dropdown'),
                trailing: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
    );
  }
}

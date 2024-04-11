import 'package:flutter/material.dart';
import 'package:practice/PostApi/sign_in.dart';
import 'package:practice/PostApi/sign_up.dart';
import 'package:practice/PostApi/upload_image.dart';
// import 'package:practice/screens/get_api_screen.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostApiScreenState createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Post API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ReusableWidget(
              title: 'SignUp',
              subTitle: 'sign up api integration using open source api',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
            ),
            ReusableWidget(
              title: 'SignIn',
              subTitle: 'sign in api integration using open source api',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
            ),
            ReusableWidget(
              title: 'Upload image to server',
              subTitle: 'Upload image to server using image path(url)',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadImageScreen()));
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
          child: Text('P'),
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

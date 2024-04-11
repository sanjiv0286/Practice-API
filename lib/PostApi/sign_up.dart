// // ignore_for_file: avoid_print

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void login(String email , password) async {

//     try{

//       Response response = await post(
//         Uri.parse('https://reqres.in/api/login'),
//         body: {
//           'email' : email,
//           'password' : password
//         }
//       );

//       if(response.statusCode == 200){

//         var data = jsonDecode(response.body.toString());
//         print(data['token']);
//         print('Login successfully');

//       }else {
//         print('failed');
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up Api'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 hintText: 'Email'
//               ),
//             ),
//             const SizedBox(height: 20,),
//             TextFormField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                   hintText: 'Password'
//               ),
//             ),
//             const SizedBox(height: 40,),
//             GestureDetector(
//               onTap: (){
//                 login(emailController.text.toString(), passwordController.text.toString());
//               },
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: const Center(child: Text('Login'),),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ****************************************************************
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  // const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Only get SignUp by this email:-eve.holt@reqres.in
  // and password:-pistol

  // ignore: non_constant_identifier_names
  void SignUp(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        stdout.write(data);
        toastMessage('Account Created Successfully');
      } else {
        toastMessage('FAILED');
      }
    } catch (e) {
      toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Learn Post-Api | SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                SignUp(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('SignUp'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

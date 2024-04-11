// // ignore_for_file: avoid_print, unnecessary_new
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class UploadImageScreenScreen extends StatefulWidget {
//   const UploadImageScreenScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _UploadImageScreenScreenState createState() => _UploadImageScreenScreenState();
// }

// class _UploadImageScreenScreenState extends State<UploadImageScreenScreen> {
//   File? image;
//   final _picker = ImagePicker();
//   bool showSpinner = false;

//   Future getImage() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       print('no image selected');
//     }
//   }

//   Future<void> UploadImageScreen() async {
//     setState(() {
//       showSpinner = true;
//     });

//     var stream = new http.ByteStream(image!.openRead());
//     stream.cast();

//     var length = await image!.length();

//     var uri = Uri.parse('https://fakestoreapi.com/products');

//     var request = new http.MultipartRequest('POST', uri);

//     request.fields['title'] = "Static title";

//     var multiport = new http.MultipartFile('image', stream, length);

//     request.files.add(multiport);

//     var response = await request.send();

//     print(response.stream.toString());
//     if (response.statusCode == 200) {
//       setState(() {
//         showSpinner = false;
//       });
//       print('image uploaded');
//     } else {
//       print('failed');
//       setState(() {
//         showSpinner = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Upload Image'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 getImage();
//               },
//               child: Container(
//                 child: image == null
//                     ? const Center(
//                         child: Text('Pick Image'),
//                       )
//                     : Center(
//                         child: Image.file(
//                           File(image!.path).absolute,
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//               ),
//             ),
//             const SizedBox(
//               height: 150,
//             ),
//             GestureDetector(
//               onTap: () {
//                 UploadImageScreen();
//               },
//               child: Container(
//                 height: 50,
//                 width: 200,
//                 color: Colors.green,
//                 child: const Center(child: Text('Upload')),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ***************************************************************
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      toastMessage('No Image Selected');
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> UploadImageScreen() async {
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = http.MultipartRequest('post', uri);

    request.fields['title'] = 'Static title';

    var multiport = http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      toastMessage('Image Uploaded');
    } else {
      setState(() {
        showSpinner = false;
      });
      toastMessage('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Post-Api | Upload Images'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? const Center(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                        ),
                      )
                    : Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 300,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                UploadImageScreen();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Upload'),
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

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  final List<String> myProducts = [ "Posts" , "Comments" , "Albums" , "Todos" , "Users" ,
    'Login & SignUp' ,"Upload Image To Server"] ;
  final List<Color> colors = <Color>[Colors.red, Colors.green,Colors.amber , Colors.red, Colors.blue,Colors.amber, Colors.red, ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('APIs Course'),),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: myProducts.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(myProducts[index].toString(),textAlign: TextAlign.center , style: Theme.of(context).textTheme.titleLarge,),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
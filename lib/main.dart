import 'package:flutter/material.dart';

import 'screens/build_main_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black38),
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
         // ignore: avoid_print
              print("Back button is pressed");
            },
            icon:const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ],
          title: const Text("Blood Bank"),
          centerTitle: true,
        ),
        body: const BuildMainBody(),
      ),
    );
  }
}

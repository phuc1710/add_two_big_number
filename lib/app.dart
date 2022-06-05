import 'package:flutter/material.dart';

import 'home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Add Two Big Number',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';

import 'add_form.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cộng 2 số lớn'),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const AddForm(),
          ),
        ),
      ),
    );
  }
}


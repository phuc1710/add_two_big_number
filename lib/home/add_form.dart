import 'package:flutter/material.dart';

import '../model/addition.dart';

class AddForm extends StatefulWidget {
  const AddForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final _addition = Addition();
  String result = 'Kết quả: ';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số thứ nhất',
              ),
              maxLines: 1,
              validator: (val) => _validateInt(val),
              onSaved: (val) => setState(() => _addition.num1 = val!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số thứ hai',
              ),
              maxLines: 1,
              validator: (val) => _validateInt(val),
              onSaved: (val) => setState(() {_addition.num2 = val!;}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(result),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    setState(() =>
                        result = 'Kết quả: ${_addition.addTwoLargeNumber()}');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Tính', style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String? _validateInt(String? val) {
    if (val!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(val)) {
      setState(() {
        result = 'Kết quả: ';
      });
      return ('Vui lòng nhập số tự nhiên!');
    } else {
      return null;
    }
  }
}

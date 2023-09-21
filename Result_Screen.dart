import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> editTextList = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        backgroundColor: Colors.black12,

        centerTitle: true,
        title: Text('Saved items Values'),
      ),
      body: ListView.builder(
        itemCount: editTextList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(editTextList[index]),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'Result_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> editTextList = [];

  void addEditText() {
    setState(() {
      editTextList.add('');
    });
  }

  void deleteEditText(int index) {
    setState(() {
      editTextList.removeAt(index);
    });
  }

  void saveAndNavigate() {
    Navigator.pushNamed(context, '/second', arguments: editTextList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text('ITEM LIST',textAlign: TextAlign.center,),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: editTextList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    width: 240,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (text) {
                              editTextList[index] = text;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteEditText(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 100)),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('CREATE'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black12),
                onPressed: addEditText,
              ),

              SizedBox(width: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('save'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black12),
                onPressed: saveAndNavigate,
              ),

            ],
          ),
        ],
      ),
    );
  }
}



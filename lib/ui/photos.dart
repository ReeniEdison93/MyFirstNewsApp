import 'package:flutter/material.dart';

class Photopage extends StatefulWidget {
  @override
  _PhotopageState createState() => _PhotopageState();
}

class _PhotopageState extends State<Photopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text ('Photos'),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),
    );
  }
}


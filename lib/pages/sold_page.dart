import 'dart:html';

import 'package:flutter/material.dart';

class soldpage extends StatefulWidget {
  soldpage({Key? key}) : super(key: key);

  @override
  State<soldpage> createState() => _soldpageState();
}

class _soldpageState extends State<soldpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.grey,
      title: Center(child: Text('Sold Items')),
    )
    );
  }
}

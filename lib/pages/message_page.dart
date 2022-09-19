import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class messages extends StatefulWidget {
  messages({Key? key}) : super(key: key);

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Bubble(
          margin: const BubbleEdges.only(top: 10),
          alignment: Alignment.bottomLeft,
          nip: BubbleNip.leftTop,
          child: const Text(
              'Welcome to VIPNumnberFamily, How may I help U Sir ? U can call/Whatsapp Us Also on +91-8363-******'),
        ),
      ],
    );
  }
}

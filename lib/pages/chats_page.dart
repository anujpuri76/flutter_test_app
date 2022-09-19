import 'package:flutter/material.dart';
import 'package:flutter_test_app1/pages/message_page.dart';
import 'package:go_router/go_router.dart';

class chatspage extends StatefulWidget {
  chatspage({Key? key}) : super(key: key);

  @override
  State<chatspage> createState() => _chatspageState();
}

class _chatspageState extends State<chatspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 68, 68, 68),
          title: Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/lg.4.png"),
            ),
            SizedBox(
              width: 330,
            ),
            PopupMenuButton(
                color: Color.fromARGB(255, 61, 61, 61),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Change Name '),
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      PopupMenuItem(
                        child: Text('Email transcript'),
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      PopupMenuItem(
                        child: Text('Sound On'),
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      PopupMenuItem(
                        child: Text('POP out widget'),
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      PopupMenuItem(
                        child: Text('Add chat to your website'),
                        textStyle: TextStyle(color: Colors.white),
                      ),
                    ])
          ])),
      body: Column(children: [
        Expanded(child: messages()),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Flexible(
                  child: TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 53, 53, 53), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 53, 53, 53),
                                width: 1)),
                        hintText: "Write a reply",
                        icon: Icon(Icons.camera),
                      )))
            ],
          ),
        )
      ]),
    );
  }
}

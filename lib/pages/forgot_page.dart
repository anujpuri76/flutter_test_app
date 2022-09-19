import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class forgotpage extends StatelessWidget {
  const forgotpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Image.asset(
          "assets/images/lg.4.png",
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(225, 250, 246, 247),
                    filled: true,
                    icon: Icon(Icons.mail),
                    hintText: "Enter Mobile No./ Email ID",
                    labelText: "Email or Mobile",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email address or mobile no . ";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  context.go("/home");
                },
                child: Column(
                  children: [
                    Container(
                      width: 160,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        'Forgot',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 124, 83),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

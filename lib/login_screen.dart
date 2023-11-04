import 'dart:async';

import 'package:flutter/material.dart';
import 'package:police/main_scareen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //variables
  bool changeColor = true;
  bool changePassIcon = true;
 
  TextEditingController emailController = TextEditingController(text: "qut");
  TextEditingController passController = TextEditingController(text: "123");

  @override
  void initState() {
    // emailController.text = "qut";
    // passController.text = "123";
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (Timer t) {
      // setState(() {});
      // changeColor = !changeColor;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
                child: Row(
                  children: [
                    // Expanded(
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         color: changeColor ? Colors.red : Colors.blue,
                    //         borderRadius: const BorderRadius.only(
                    //             topLeft: Radius.circular(25),
                    //             bottomLeft: Radius.circular(25))),
                    //   ),
                    // ),
                    alLwaa7(
                        color: changeColor ? Colors.blue : Colors.red,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    // Expanded(
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         color: changeColor ? Colors.blue : Colors.red,
                    //         borderRadius: const BorderRadius.only(
                    //             topRight: Radius.circular(25),
                    //             bottomRight: Radius.circular(25))),
                    //   ),
                    // ),
                    alLwaa7(
                        color: changeColor ? Colors.red : Colors.blue,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          emailController.text = "";
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: passController,
                  // controller: emailController,
                  // hide password
                  obscureText: changePassIcon,
                  // keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    suffixIcon: SizedBox(
                      width: 96,
                      child: Row(
                        children: [
                          IconButton(
                            icon: (changePassIcon
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                            onPressed: () {
                              setState(() {});
                              changePassIcon = !changePassIcon;
                            },
                          ),
                          IconButton(
                            icon: (Icon(Icons.close)),
                            onPressed: () {
                              setState(() {});
                              passController.text = "";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isEmpty) {
                            // print("please put your email");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("please put your email"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else if (passController.text.isEmpty) {
                            // print("please put your password");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("please put your password"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            if (emailController.text != "qut" ||
                                passController.text != "123") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content:
                                          Text("Email or password is Valid")));
                              // emailController.text = "qut";
                              // passController.text = "123";
                            }
                            //  else if (passController.text != "123") {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text("password not valid"),
                            //     ),
                            //   );
                            // }
                            // print("all is good");
                            else {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return const MainScreen();
                              }));
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(builder: (ctx) {
                              //   return const MainScreen();
                              // }), (route) => false);
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for alLwaa7
  Widget alLwaa7({required color, required borderRadius}) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

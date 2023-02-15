import 'dart:convert';

import 'package:connect_php/create.dart';
import 'package:connect_php/service/login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  var errorMessage = null;
  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
            // loginNcZ (4:264)
            padding: EdgeInsets.fromLTRB(30, 17, 14.34, 11),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              children: [
                Container(
                  // rectangle17P7 (4:280)
                  margin: EdgeInsets.fromLTRB(0, 0, 13.66, 44),
                  width: 352,
                  height: 330,
                  child: SafeArea(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/login_header.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(children: [
                  Text("Bonjour !",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Nous sommes ravis de vous revoir"),
                  Visibility(
                      visible: errorMessage != null,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            errorMessage.toString(),
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )
                        ],
                      )),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Email", border: InputBorder.none),
                          ),
                        )),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: mdpController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Mot de passe",
                                border: InputBorder.none),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            String message = await login(
                                emailController.text, mdpController.text);
                            if (message != null) {
                              setState(() {
                                errorMessage = message;
                              });
                            }
                          },
                          icon: Icon(Icons.send),
                          label: Text(
                            "Se Connecter",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.purple[500]),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous n'avez pas de compte? "),
                      InkWell(
                        onTap: () => Get.off(CreateUser()),
                        child: Text(
                          'Inscription',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple[500]),
                        ),
                      )
                    ],
                  )
                ]),

                // mailaXb (4:292)
              ],
            ))
      ],
    ));
  }
}

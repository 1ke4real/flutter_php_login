import 'dart:convert';
import 'package:connect_php/connect.dart';
import 'package:connect_php/service/create_user.dart';
import 'package:connect_php/service/login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var errorMessage = null;
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 200),
              Text("Bienvenue !",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Créez vous un compte"),
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
                        obscureText: true,
                        controller: mdpController,
                        decoration: InputDecoration(
                            hintText: "Mot de passe", border: InputBorder.none),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 340,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      String message = await create(
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
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.purple[500]),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous avez deja un compte ? "),
                  InkWell(
                    onTap: () => Get.off(ConnectPage()),
                    child: Text(
                      'Connection',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.purple[500]),
                    ),
                  )
                ],
              )
            ]),
      ],
    ));
  }
}

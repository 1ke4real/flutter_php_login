import 'dart:convert';

import 'package:connect_php/connect.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConctOK extends StatefulWidget {
  const ConctOK({super.key});

  @override
  State<ConctOK> createState() => _ConctOKState();
}

class _ConctOKState extends State<ConctOK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // loginNcZ (4:264)
            padding: EdgeInsets.fromLTRB(30, 17, 14.34, 11),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(children: [
              Container(
                // rectangle17P7 (4:280)
                margin: EdgeInsets.fromLTRB(0, 0, 13.66, 44),
                width: 352,
                height: 330,
                child: SafeArea(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/header_welcome.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Bienvenue !",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                      "Il s'agis d'un prototype de système de connection et création de compte avec un backend en php et mysql.",
                      textAlign: TextAlign.center),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () => Get.off(ConnectPage()),
                      icon: Icon(Icons.logout),
                      label: Text('Se déconnecter'),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.purple[500]),
                    ),
                  )
                ],
              )
            ])));
  }
}

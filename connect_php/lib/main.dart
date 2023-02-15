import 'dart:convert';
import 'dart:io';
import 'package:connect_php/home.dart';
import 'package:connect_php/service/login.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:connect_php/connect.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController = TextEditingController();
  final mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConnectPage();
  }
}

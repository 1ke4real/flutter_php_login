import 'dart:convert';
import 'dart:io';
import 'package:connect_php/home.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:connect_php/connect.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<String> login(String email, String mdp) async {
  try {
    final response = await http.post(Uri.parse("http://192.168.2.31:8888/"),
        body: {'email': email, 'mdp': mdp});
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata['status'] == 1) {
        print("connecter");
        Get.off(ConctOK());
        return "";
      } else {
        return "Erreur: Les identifiants sont incorect";
      }
    } else {
      return "Erreur: " + response.statusCode.toString();
    }
  } catch (error) {
    return "Erreur: " + error.toString();
  }
}

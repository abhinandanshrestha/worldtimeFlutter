import 'package:flutter/material.dart';
import 'package:wtime/pages/choose_location.dart';
import 'package:wtime/pages/home.dart';
import 'package:wtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', //for testing purpose
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

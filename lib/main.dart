import 'package:flutter/material.dart';
import 'package:my_awesome_app/startingscreen.dart';

void main() {
  runApp(BiherEg());
}

class BiherEg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Comfortaa'),
        debugShowCheckedModeBanner: false,
        title: "Biher Eg",
        home: Starting(0));
  }
}

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/bookster.png",
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bookster",
                      style: TextStyle(
                          color: Color(0xFF0194BA),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Not only for Bookworms",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: height - 170,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                  child: Text("ver : 1.0.1    ")),
                Row(
                  children: <Widget>[
                    Text("Developed with "),
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("by Cuboids Club"),
                    Image.asset("assets/cuboids.png", height: 30)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

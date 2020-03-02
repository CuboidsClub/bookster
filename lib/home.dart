import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'lessons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0194BA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Bookster",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     SizedBox(height: 80.0),
            //     Text(
            //       "All ",
            //       style: TextStyle(fontSize: 43.0),
            //     ),
            //     SizedBox(height: 100.0),
            //     RotateAnimatedTextKit(
            //         text: ["Subjects", "Resources", "Books"],
            //         textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
            //         textAlign: TextAlign.center,
            //         alignment:
            //             AlignmentDirectional.topStart // or Alignment.topLeft
            //         ),
            //   ],
            // ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                addAutomaticKeepAlives: true,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .23,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              5), // color: Colors.black54,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/bg.jpg"))),
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Lessons()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .23,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                                colors: [Colors.black38, Colors.black26],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.5, 1]),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 8),
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: "graphics",
                                  child: Text(
                                    "Engineering Graphics",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "By Senthil Kumar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

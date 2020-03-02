import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_awesome_app/problems.dart';

class Lessons extends StatefulWidget {
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 150,
            color: Color(0xFF0194BA),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                splashColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 30,
                    ),
                    Hero(
                      tag: "graphics",
                      child: Text(
                        "  Engineering Graphics",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height - 100,
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection("graphics")
                    .orderBy("index")
                    .snapshots(),
                builder: (context, snap) {
                  if (!snap.hasData)
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  else
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snap.data.documents.length,
                      itemBuilder: (context, index) {
                        print(snap.data.documents[0].documentID);
                        return Material(
                          child: InkWell(
                            splashColor: Color(0xFF0194BA),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Problems(
                                        snapshot: snap.data.documents[index],
                                      )));
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 50,
                                height:
                                    MediaQuery.of(context).size.height * .09,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                              .15 -
                                          10,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .09,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF0194BA),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),

                                    //Use media query here
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .75,
                                      child: Text(
                                        "   ${snap.data.documents[index].data['name']}",
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                },
              )),
        ],
      ),
    );
  }
}

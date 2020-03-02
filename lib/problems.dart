import 'dart:convert';
// import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Problems extends StatefulWidget {
  Problems({@required this.snapshot});
  final DocumentSnapshot snapshot;
  @override
  _ProblemsState createState() => _ProblemsState(snapshot);
}

class _ProblemsState extends State<Problems> {
  var id, decodeData;
  http.Response data;
  int activeNum = 0;
  YoutubePlayerController _controller;
  // ChewieController chewieCtrl;
  _ProblemsState(this.snapshot1);
  DocumentSnapshot snapshot1;
  @override
  void initState() {
    changeMe(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  changeMe(i) async {
    print("change me called");
    id = widget.snapshot.data['problems'][i]['link']
        .toString()
        .split(".be/")[1]
        .toString();
    // http.Response response =
    //     await http.get("https://bookster.varunkumar.now.sh/youtube2mp4?id=$id");
    // Map<String, dynamic> map = await json.decode(response.body);
    setState(() {
      activeNum = i;
      print("object");
      _controller = YoutubePlayerController(
        initialVideoId: id,
      );
      // _controller.pause();
      // _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.snapshot.data['name'],
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        body: Column(
          children: <Widget>[
            //Question videO
            // (_controller == null)
            //     ? AspectRatio(
            //         aspectRatio: 4 / 3,
            //         child: Container(
            //           color: Colors.black,
            //           child: Center(
            //               child: CircularProgressIndicator(
            //             backgroundColor: Colors.black,
            //           )),
            //         ),
            //       )
            //     :
            YoutubePlayer(
              controller: _controller,
              // onEnded: changeMe(activeNum++) ,
              showVideoProgressIndicator: true,
              // bottomActions: <Widget>[
              //   CurrentPosition(),
              //   ProgressBar(isExpanded: true),
              // ],
            ),

            //List of questions
            Container(
              height: _height - (_width / (4 / 3)) - 100,
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  ExpansionTile(
                    title: Text(
                        widget.snapshot.data['problems'][activeNum]['question'],
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                    children: <Widget>[
                      Text(widget.snapshot.data['problems'][activeNum]
                          ['question'])
                    ],
                  ),
                  for (int i = 0;
                      i < widget.snapshot.data['problems'].length;
                      i++)
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          // _controller.pause();
                          changeMe(i);
                          // setState(() {
                          //   activeNum = i;
                          // }); // 'https:\/\/r1---sn-aigl6n76.googlevideo.com\/videoplayback?expire=1573688346&ei=uj_MXcWiDsmMxwLOhq-gAw&ip=185.27.134.50&id=o-AD3PCwBq0h8SJbssyH6Sx_tZpB9zVhqU7v0csCPXjhzU&itag=22&source=youtube&requiressl=yes&mm=31%2C26&mn=sn-aigl6n76%2Csn-5hnedn7l&ms=au%2Conr&mv=u&mvi=0&pl=23&mime=video%2Fmp4&ratebypass=yes&dur=31.857&lmt=1560450399699445&mt=1573666153&fvip=1&fexp=23842630&c=WEB&txp=2211222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIgc0Rhf2wjqJsor8syPpkT6RpdI8itL3lNbN7C4UYAUxYCIQCgLJDKnr2Yu42Zgd9lQik-Bmpvqodro6kxWeEE1inY5Q%3D%3D&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AHylml4wRQIgT2G5LOc0yCdTXPl8rUaryg9G6Nlzj7eVJHbnc-imn-cCIQDWOPBtTsW9t235AgQ-8rC0_aCpfTLrDhOBOvtirNn5vQ%3D%3D');
                        },
                        child: Container(
                            width: _width * .80,
                            padding: EdgeInsets.all(20),
                            color:
                                (activeNum == i) ? Colors.blue : Colors.white,
                            child: Text(
                              '${i + 1}. ${widget.snapshot.data['problems'][i]['question']}',
                              softWrap: true,
                              maxLines: 100,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  height: 1.3,
                                  color: (activeNum == i)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18),
                            )),
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

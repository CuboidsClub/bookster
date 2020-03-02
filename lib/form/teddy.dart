// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'signin_button.dart';
// import 'teddy_controller.dart';
// import 'tracking_text_input.dart';

// var data1, data2, data3;

// class MyTeddy extends StatefulWidget {
//   MyTeddy({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyTeddyState createState() => _MyTeddyState();
// }

// class _MyTeddyState extends State<MyTeddy> {
//   TeddyController _teddyController;
//   @override
//   initState() {
//     _teddyController = TeddyController();
//     super.initState();
//   }

//   TextEditingController _controller= TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     EdgeInsets devicePadding = MediaQuery.of(context).padding;

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
//       body: Container(
//           child: Stack(
//         children: <Widget>[
//           Positioned.fill(
//               child: Container(
//             decoration: BoxDecoration(
//               // Box decoration takes a gradient
//               gradient: LinearGradient(
//                 // Where the linear gradient begins and ends
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 // Add one stop for each color. Stops should increase from 0 to 1
//                 stops: [0.0, 1.0],
//                 colors: [
//                   Color.fromRGBO(170, 207, 211, 1.0),
//                   Color.fromRGBO(93, 142, 155, 1.0),
//                 ],
//               ),
//             ),
//           )),
//           Positioned.fill(
//             child: SingleChildScrollView(
//                 padding: EdgeInsets.only(
//                     left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         alignment: Alignment.center,
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: Text("FeedBack",overflow: TextOverflow.ellipsis,style:TextStyle(color: Colors.black87,fontSize:40)),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height*.02,),
//                       Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(25.0))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(30.0),
//                             child: Form(
//                                 child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: "Name",
//                                     hintText: "what's ur name"
//                                   ),
//                                 ),
//                                 TrackingTextInput(
//                                   label: "Email",
//                                   hint: "What's your email address?",
//                                   onCaretMoved: (Offset caret) {
//                                     _teddyController.lookAt(caret);
//                                   },
//                                   onTextChanged: (String value) {
//                                     _teddyController.setPassword(value);
//                                     data1 = value;
//                                   },
//                                 ),
//                                 SizedBox(height: 15,),
//                                 Container(
//             height: 200,
//             color: Color(0xffeeeeee),
//             padding: EdgeInsets.all(10.0),
//             child: new ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxHeight: 200.0,
//               ),
//               child: new Scrollbar(
//                 child: new SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   reverse: true,
//                   child: SizedBox(
//                     height: 190.0,
//                     child: new TextField(
//                       maxLines: 100,
//                       decoration: new InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Add your text here',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                                 SizedBox(height: 30,),
//                                 SigninButton(
//                                     child: Text("Submit",
//                                         style: TextStyle(
//                                             fontFamily: "RobotoMedium",
//                                             fontSize: 16,
//                                             color: Colors.white)),
//                                     onPressed: () async {
//                                       var status = _teddyController.submitData(
//                                           data1, data2, data3);
//                                     //  if(status=="done")
//                                     //  showDialog(
//                                     //       context: context,
//                                     //       builder: (BuildContext context) {
//                                     //         return RichAlertDialog(
//                                     //           //uses the custom alert dialog
//                                     //           alertTitle:
//                                     //               richTitle("Hurray"),
//                                     //           alertSubtitle:
//                                     //               richSubtitle("We will get back to you soon"),
//                                     //           alertType: RichAlertType.SUCCESS,
//                                     //         );
//                                     //       });
//                                     })
//                               ],
//                             )),
//                           )),
//                     ])),
//           ),
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:my_awesome_app/startingscreen.dart';
import 'package:rich_alert/rich_alert.dart';
import 'signin_button.dart';
import 'teddy_controller.dart';
import 'tracking_text_input.dart';

class MyTeddy extends StatefulWidget {
  MyTeddy({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTeddyState createState() => _MyTeddyState();
}

class _MyTeddyState extends State<MyTeddy> {
  var data1, data2, data3;
  TextEditingController txt1, txt2, txt3 = TextEditingController();
  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO(170, 207, 211, 1.0),
                  Color.fromRGBO(93, 142, 155, 1.0),
                ],
              ),
            ),
          )),
          Positioned.fill(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 200,
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: FlareActor(
                            "assets/Teddy.flr",
                            shouldClip: false,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.contain,
                            controller: _teddyController,
                          )),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TrackingTextInput(
                                  label: "Name",
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.lookAt(caret);
                                  },
                                  onTextChanged: (String value) {
                                    // txt1.value = value as TextEditingValue;
                                    // _teddyController.setPassword(value);
                                    data1 = value;
                                  },
                                ),
                                TrackingTextInput(
                                  label: "Email",
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.lookAt(caret);
                                  },
                                  onTextChanged: (String value) {
                                    // txt2.value = value as TextEditingValue;
                                    // _teddyController.setPassword(value);
                                    data2 = value;
                                  },
                                ),
                                TrackingTextInput(
                                  label: "Feedback",
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.lookAt(caret);
                                  },
                                  onTextChanged: (String value) {
                                    // txt3.value = value;
                                    // _teddyController.setPassword(value);
                                    data3 = value;
                                  },
                                ),
                                SigninButton(
                                    child: Text("Sign In",
                                        style: TextStyle(
                                            fontFamily: "RobotoMedium",
                                            fontSize: 16,
                                            color: Colors.white)),
                                    onPressed: () async {
                                      var status = _teddyController.submitData(
                                          data1, data2, data3);
                                      // txt1.value.toString(),
                                      // txt2.value.toString(),
                                      // txt3.value.toString());
                                      if (status == "done") {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Starting(1)));
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return RichAlertDialog(
                                                //uses the custom alert dialog
                                                alertTitle: richTitle("Hurray"),
                                                alertSubtitle: richSubtitle(
                                                    "We will get back to you soon"),
                                                alertType:
                                                    RichAlertType.SUCCESS,
                                              );
                                            });
                                      }
                                    })
                              ],
                            )),
                          )),
                    ])),
          ),
        ],
      )),
    );
  }
}

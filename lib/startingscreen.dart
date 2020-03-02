import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_awesome_app/about.dart';
import 'package:my_awesome_app/feedback.dart';
import 'package:my_awesome_app/form/teddy.dart';
import 'package:my_awesome_app/intro.dart';
import 'package:my_awesome_app/notifications.dart';
import 'feedback.dart';
import 'home.dart';

int index;

class Starting extends StatefulWidget {
  Starting(this.tab);
  final tab;
  @override
  State<StatefulWidget> createState() {
    return StartingState();
  }
}

class StartingState extends State<Starting> with WidgetsBindingObserver {
  int _selectedPage;
  BuildContext contxt;
  check() async {
    var box = await Hive.openBox('myBox');
    if (box.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contxt) => Intro()));
    }
  }

  List<BottomNavigationBarItem> bottomList = [
    BottomNavigationBarItem(
        icon: Icon(Icons.library_books),
        title: Text(
          "Subjects",
          style: TextStyle(fontFamily: 'SFProDisplay', fontSize: 12.0),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.feedback),
        title: Text(
          "Feedback",
          style: TextStyle(fontFamily: 'SFProDisplay', fontSize: 12.0),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.info_outline),
        title: Text(
          "About us",
          style: TextStyle(fontFamily: 'SFProDisplay', fontSize: 12.0),
        )),
  ];

  final pages = [Home(), MyTeddy(), AboutUs()];

  @override
  void initState() {
    _selectedPage=widget.tab;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarDividerColor: Colors.black,
    //     systemNavigationBarColor: Colors.white,
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     systemNavigationBarIconBrightness: Brightness.dark));
    // WidgetsBinding.instance.addObserver(this);
    FirebaseNotifications noti = FirebaseNotifications();
    noti.setUpFirebase();
    super.initState();
  }

  Future<bool> _showAlert() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure want to Exit?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _showAlert,
        child: Scaffold(
          body: pages[_selectedPage],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2, color: Colors.black26),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10.0,
                  ),
                ]),
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Color(0xFF0194BA),
                unselectedItemColor: Color(0xFF0e3e69),
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedPage,
                onTap: (index) => setState(() {
                      _selectedPage = index;
                    }),
                items: bottomList),
          ),
        ),
      ),
    );
  }
}

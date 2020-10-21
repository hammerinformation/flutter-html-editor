import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///https://github.com/hammerinformation/flutter-html-editor



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _controller = new TextEditingController();
  String myHtmlFile = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                flex: 14,
                child: CupertinoTextField(
                  showCursor: true,
                  style: TextStyle(color: Colors.green, fontSize: 15),
                  cursorColor: Colors.white,
                  cursorHeight: 22,
                  decoration: BoxDecoration(color: Colors.black),
                  maxLines: 40000,
                  maxLength: 450,
                  controller: _controller,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(76, 0, 76, 0),
                  child: CupertinoButton(
                    child: Text("Run"),
                    color: Colors.indigoAccent,
                    onPressed: () {
                      setState(() {
                        myHtmlFile = _controller.text;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Html(
                  data: myHtmlFile,
                )))
      ],
    )));
  }
}

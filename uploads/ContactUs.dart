import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:party_app/home_page.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'ApiList.dart';

class ContactUs extends StatefulWidget {
  @override
  ContactUsPage createState() => ContactUsPage();
}

class ContactUsPage extends State<ContactUs> {
  AnimationController _controller;
  double screenHeight;
  double screenwidth;
  File _image;
  bool status = false;
  ProgressDialog pr;
  Map<String, dynamic> value;
  Map<String, dynamic> value1;
  List<dynamic> listData;
  Map data;
  var name;
  var mail;
  var address;
  var number;
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();



  Future<Map<String, dynamic>> getData() async {
    //  print(myController1.text);
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.show();
    // print(token);
    final response = await http.post(APIS.addMessage,
        headers: {'Accept': 'application/json'},
        body: {"name": nameController.text,
          "email": emailController.text,
        "message":messageController.text});
    print(response.body);
    var parsedJson = json.decode(response.body);
    value = parsedJson['data'];
    print("Status = " + parsedJson['status']);
    if (parsedJson['status'] == "1") {
      pr.dismiss();
      Toast.show("" + parsedJson['message'], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      //_onChanged(value);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      pr.dismiss();
      Toast.show("" + parsedJson['message'], context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

    }
    return parsedJson;
  }

  Future getContact() async {
    // _isProgressBarShown = true;
    http.Response response = await http
        .get(APIS.ownerDetail);
    var datatc = json.decode(response.body);
    setState(() {
      name=datatc['data']['Name'];
      mail=datatc['data']['Email'];
      address=datatc['data']['Address'];
      number=datatc['data']['Mobile'];

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(220, 84, 85, 0.8),
              Color.fromRGBO(140, 53, 52, 1)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Stack(
            children: <Widget>[
              profile_Page(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile_Page(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      alignment: Alignment.bottomCenter,
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                            top: 0.0,
                          ),
                          child: Center(
                            child: Container(
                              child: Image.asset(
                                "images/phone_call.png",
                                fit: BoxFit.fill,
                                height: 55,
                                width: 55,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Center(
                        child: Text(
                          "CONTACT US",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 20, 0, 5),
                child: Center(
                  child: Text(
                    "FEEL FREE TO DROP US A MESSAGE OR CALL",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: new Card(
                  elevation:6,
                  margin: new EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  color: Colors.white,

                  child: new Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "images/user_red.png",
                                height: 10,
                                width: 10,
                              ),
                            ),
                            Container(
                              child: new Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Your Name*",
                                      hintStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.redAccent,
                                          letterSpacing: 1),

                                    ),
                                    controller: nameController,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: new Card(
                  elevation:6,
                  margin: new EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: new Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "images/email.png",
                                height: 10,
                                width: 10,
                              ),
                            ),
                            Container(
                              child: new Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Your Email*",
                                      hintStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.redAccent,
                                          letterSpacing: 1),

                                    ),
                                    controller: emailController,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 120,
                child: new Card(
                  elevation:6,
                  margin: new EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: new Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),

                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "images/chat.png",
                                height: 10,
                                width: 10,
                              ),
                            ),
                            Container(
                              child: new Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Your Message*",
                                      hintStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.redAccent,
                                          letterSpacing: 1),
                                    ),
                                    controller: messageController,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 250,
                height: 45,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {});
                    getData();

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: EdgeInsets.all(0.0),
                  color: Colors.red,
                  child: Center(
                    child: Container(
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "SEND",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2.0),

                        ),

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 45, 0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "NAME: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Raleway",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                " $name",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "Raleway",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "EMAIL ID: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Raleway",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                " $mail",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: "Raleway",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: (){
                            launch("tel://"+number);
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.fromLTRB(8, 8,8, 8),
                            child: Image.asset(
                              "images/call.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ADDRESS: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Raleway",
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      " $address ",
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Raleway",
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

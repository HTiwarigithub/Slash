import 'package:flutter/material.dart';
import 'package:shopping_bud/aboutme.dart';
import 'All_done.dart';
import 'profile_screen.dart';
class InterestsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Interests();
  }
}

class Interests extends State<InterestsScreen> {
  bool _visibleArt = false;
  bool _visibleTv=false;
  bool _visibleTech=false;

  bool _visibleFood = false;
  bool _visibleAnimal=false;
  bool _visibleFitness=false;

  bool _visibleCars = false;
  bool _visibleSports=false;
  bool _visibleBooks=false;

  bool _visibleTravel = false;
  bool _visibleCulture=false;
  bool _visiblePoetry=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(255, 168, 81, 0.8),
            Color.fromRGBO(207, 0, 105, 0.6),
          ])),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(left: 80),
                        alignment: Alignment.center,
                        child: Text(
                          'Select Interest',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto",
                              letterSpacing: 5.0,
                              fontSize: 18),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 0.0),
                        width: 80,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("Art!!");
//                        if(_visibleArt==true ){
//                             setState(() {
//                               _visibleArt=false;
//
//                                  });
//                                      }
                        if(_visibleArt==false){
                          setState(() {
                            _visibleArt=true;
                          });
                        }
//
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                              visible: _visibleArt,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 10),
                                      child: Text(
                                        "Art & Design",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("TV");
                            if(_visibleTv==false){
                              setState(() {
                                _visibleTv=true;
                              });
                            }
                           },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                  visible: _visibleTv,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 10),
                                      child: Text(
                                        "Tv & Music",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("Tech!!");
                            if(_visibleTech==false){
                              setState(() {
                                _visibleTech=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                              visible: _visibleTech,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Tech",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 0.0),
                        width: 80,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("food!!");
                            if(_visibleFood==false){
                              setState(() {
                                _visibleFood=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                               visible: _visibleFood,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Food",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("Animal!!");
                            if(_visibleAnimal==false){
                              setState(() {
                                _visibleAnimal=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                   visible: _visibleAnimal,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Animal",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("fitness!!");
                            if(_visibleFitness==false){
                              setState(() {
                                _visibleFitness=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                    visible: _visibleFitness,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Fitness & Health",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 0.0),
                        width: 80,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("cars!!");
                            if(_visibleCars==false){
                              setState(() {
                                _visibleCars=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                 visible: _visibleCars,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Cars",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("sports!!");
                            if(_visibleSports==false){
                              setState(() {
                                _visibleSports=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                visible: _visibleSports,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Sports",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("books!!");
                            if(_visibleBooks==false){
                              setState(() {
                                _visibleBooks=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                    visible: _visibleBooks,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Books",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 0.0),
                        width: 80,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("travel!!");
                            if(_visibleTravel==false){
                              setState(() {
                                _visibleTravel=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                   visible: _visibleTravel,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Travel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 100,
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            print("culture!!");
                            if(_visibleCulture==false){
                              setState(() {
                                _visibleCulture=true;
                              });
                            }
                          },
                          child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                  visible: _visibleCulture,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                        child: Image.asset("images/whiteTick.png"),
                                        height: 30,
                                        width: 30),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40, left: 15),
                                      child: Text(
                                        "Culture",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20.0),
                      width: 100,
                      height: 130,
                      child: GestureDetector(
                        onTap: () {
                          print("poetry!!");
                          if(_visiblePoetry==false){
                            setState(() {
                              _visiblePoetry=true;
                            });
                          }
                        },
                        child: GestureDetector(
                            child: Column(
                          children: <Widget>[
                            Visibility(
                             visible: _visiblePoetry,
//                            margin: EdgeInsets.fromLTRB(
//                                70, 0, 0, 0),
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                  child: Image.asset("images/whiteTick.png"),
                                  height: 30,
                                  width: 30),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Padding(
                                padding: EdgeInsets.only(top: 40, left: 15),
                                child: Text(
                                  "Poetry",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                ),
                              ),
                            ),

                          ],
                        )),
                      ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 168, 81, 0.8),
                                  Color.fromRGBO(207, 0, 105, 0.8)
                                ]),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)))
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}


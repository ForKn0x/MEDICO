import 'package:flutter/material.dart';
import 'package:medico/Pages/home_page.dart';
import 'package:medico/Wizards/icons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class Dash1 extends StatefulWidget {
  @override
  _Dash1State createState() => _Dash1State();
}

class _Dash1State extends State<Dash1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            backgroundColor: Color(0xffF0F2F8),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      _buildBackgroundCover(),
                      _buildUserPic(),
                      _buildUserName(),
                      _buildSettingPanel(),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  _covidTracker(),
                  SizedBox(
                    height: 20,
                  ),
                  _patientDetails(),
                ],
              ),
            )),
      ],
    );
  }

  _buildBackgroundCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.green,
            Colors.teal,
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
    );
  }

  _buildUserPic() {
    return Positioned(
      top: 40,
      right:20,
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 70,
          backgroundImage: new AssetImage('images/CircleProfile.png')
      ),
    );
  }

  _buildUserName() {
    return Positioned(
        bottom: 100,
        left: 50,
        width: MediaQuery.of(context).size.width*0.4,
        child: Text(
          'User Name Here',
          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
        )
    );
  }

  _buildSettingPanel() {
    return Positioned(
        bottom: -35,
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ],
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IcoBtn(
                  ico: Icon(
                    FeatherIcons.settings,
                  ),
                ),
                IcoBtn(
                  ico: Icon(
                    FeatherIcons.shoppingCart,
                  ),
                ),
                IcoBtn(
                  ico: Icon(
                    FeatherIcons.bell,
                  ),
                ),
                IcoBtn(
                  ico: Icon(
                    FeatherIcons.logOut,
                  ),
                  onClick: () {
                    signOut();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  _covidTracker() {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width-20 ,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white70,
            Colors.white60,
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0.3,
            blurRadius: 1.1,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children:<Widget>[

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text('Covid Cases In Nepal',style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'RobotoReg'),),
                  ],
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.05,
                          vertical: MediaQuery.of(context).size.width*0.04),

                      child: Column(
                        children: <Widget>[
                          Text('Total',style: TextStyle(color: Colors.orangeAccent, fontSize: 14, fontFamily: 'RobotoReg'),),
                          SizedBox(height: MediaQuery.of(context).size.width*0.02),
                          Text('1111',style: TextStyle(color: Colors.orangeAccent, fontSize: 14, fontFamily: 'Droid Sans'),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.05,
                          vertical: MediaQuery.of(context).size.width*0.04),
                      child: Column(
                        children: <Widget>[
                          Text('Recovered',style: TextStyle(color: Colors.green, fontSize: 14, fontFamily: 'RobotoReg'),),
                          SizedBox(height: MediaQuery.of(context).size.width*0.02),
                          Text('99999999',style: TextStyle(color: Colors.green, fontSize: 14, fontFamily: 'Droid Sans'),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.05,
                          vertical: MediaQuery.of(context).size.width*0.04),
                      child: Column(
                        children: <Widget>[
                          Text('Death',style: TextStyle(color: Colors.red, fontSize: 14, fontFamily: 'RobotoReg'),),
                          SizedBox(height: MediaQuery.of(context).size.width*0.02),
                          Text('111',style: TextStyle(color: Colors.red, fontSize: 14, fontFamily: 'Droid Sans'),)
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ]),
    );
  }

  _patientDetails() {
    return Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width - 20,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.001),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white70,
              Colors.white60,
            ],
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.3,
              blurRadius: 1.1,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'RobotoReg'),
                  ),
                  Text(
                    'Weight',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'RobotoReg'),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Age',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'RobotoReg'),
                  ),

                  Text(
                    'BMI',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'RobotoReg'),
                  )
                ],
              )
            ])

    );
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }
}


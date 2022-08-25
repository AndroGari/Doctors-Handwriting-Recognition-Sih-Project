import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swathyavardhak/register.dart';

import 'main.dart';
class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  String s="bhagrawal24@gmail.com";
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          // image: AssetImage('images/LoginNEW .png'),
          image: AssetImage('images/Loginnew2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15,
                    ),
                    child: Text( user.email!
                      ,
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Convergence',
                      ),)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.27),
                    // height: 25,
                    // width: 25,
                    child: Image.asset("images/verify.png",
                      height: 140,
                      width: 125,)
                ),
              ],
            ),
            Container(

                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.52,left: 35,right: 35),
                child: Text('An Email has been sent to ' + s + '\nKindly check the Spam mail.'

                ,
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 22,
                  fontFamily: 'Convergence',

                ),)
            ),


          ],
        ),
      ),
    );
  }
}

class Desgining extends StatelessWidget {
  const Desgining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Container(
          height: 90,
          width: 90,
          child: CircularProgressIndicator(
            strokeWidth: 8,
          ),
        ),
      ),
    );
  }
}

class Lab_Report extends StatefulWidget {
  const Lab_Report({Key? key}) : super(key: key);

  @override
  State<Lab_Report> createState() => _Lab_ReportState();
}

class _Lab_ReportState extends State<Lab_Report> {
  final blue1 = const Color(0xff0d0f35);
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12 , left: 20,right: 20
            ),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Lab Reports"
                    ,style: TextStyle(
                      fontFamily: 'Convergence',
                      fontWeight: FontWeight.w600,

                      fontSize: 23,
                    ),),
                ),
                Container(
                    height: 45,
                    width: 45,

                    // padding: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      boxShadow: const [BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1.5,
                      ),],
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 178, 255, 100),
                      // color: Color.fromRGBO(132, 29, 210, 72),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/avata.png'),
                    )
                ),
              ],
            ),
          ),



        ],
      ),

    );
  }
}


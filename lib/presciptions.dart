import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swathyavardhak/register.dart';
class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  String s="bhagrawal24@gmail.com";
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
                    child: const Text('Verify Email',
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        fontSize: 37,
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
            // SizedBox(
            // //   height: MediaQuery.of(context).size.height*0.67,
            // // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  //

                    margin : EdgeInsets.only(top: MediaQuery.of(context).size.height*0.67),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0d0f35),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Pageregister();
                            }
                            ),
                          );

                        },
                        child: Text('Retry/cancel',
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                      ),
                    )
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}



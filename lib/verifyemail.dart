import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swathyavardhak/main.dart';
import 'package:swathyavardhak/register.dart';
class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final auth = FirebaseAuth.instance;
   late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    
   timer = Timer.periodic(Duration(seconds: 3), (timer) {
     checkEmailVerified();
   });
    
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Container(
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
                  child: Text('An Email has been sent to ' + "\n" + '\nKindly check the Spam mail.'

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
                            timer.cancel();
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
      ),
    );
  }
  Future<void> checkEmailVerified() async{
    user = auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    }
    
  }
}

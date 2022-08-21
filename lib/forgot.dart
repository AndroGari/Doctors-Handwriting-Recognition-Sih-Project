import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController _emailController = new TextEditingController();
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
                    child: const Text('Enter Email',
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
                    child: Image.asset("images/Frame (2).png",
                      height: 140,
                      width: 85,)
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.52,left: 35,right: 35),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                // maxLength: 10,
                controller: _emailController,
                decoration: InputDecoration(
                  // counterText: "",
                  hintText: ' Enter Email',
                  prefixIcon: Icon(Icons.mail,
                  color: Colors.black,)
                ),
              ),
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
                          FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _emailController.text).then((value) => Navigator.of(context).pop());
                        },
                        child: Text('Reset Password',
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

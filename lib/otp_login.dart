import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Otpverify extends StatefulWidget {
  const Otpverify({Key? key}) : super(key: key);

  @override
  State<Otpverify> createState() => _OtpverifyState();
}

class _OtpverifyState extends State<Otpverify> {
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
                    child: const Text('Enter Number',
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
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  // counterText: "",
                  hintText: ' Enter 10 digit number',
                  prefixIcon: Padding(padding: EdgeInsets.all(11), child: Text('+91 ',
                    style: TextStyle(
                      fontSize: 17,
                    ),)),
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
                        onPressed: (){},
                        child: Text('Continue'),
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



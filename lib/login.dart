import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swathyavardhak/forgot.dart';
import 'package:swathyavardhak/main.dart';
import 'package:swathyavardhak/otp_login.dart';
import 'package:swathyavardhak/presciptions.dart';
import 'package:swathyavardhak/register.dart';
import 'package:swathyavardhak/verifyemail.dart';
class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool toggle = true;
  bool wrongpass = false;
  final blue1 = const Color(0xff0d0f35);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/LoginNEW .png'),
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.29,
                      ),
                    child:Text('Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Convergence',
                    ),)
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.41,left: 23,right: 23),
              child: TextField(
                controller: _emailTextController,
                autocorrect: true,
                enableSuggestions: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: 'Useremail',
                  hintText: 'email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.48,left: 23,right: 23),
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _passwordTextController,
                obscureText: toggle,
                decoration: InputDecoration(
                  suffixIcon:   IconButton(
                      icon: toggle
                          ? const Icon(Icons.visibility)
                          : const Icon(
                        Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          toggle = !toggle;
                        });
                      }),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: 'Password',

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.58),
                  margin: EdgeInsets.only(top: 20),

                  child: wrongpass? Text('Wrong useremail or password ! Try Otp login',
                    style: TextStyle(
                      fontFamily: 'Redhat',
                      fontSize: 13,
                      color: Colors.red,
                    ),)
                      :Text(""),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.63),
                    // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.67)
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: blue1,
                        ),
                        onPressed: (){
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                              password: _passwordTextController.text).then((value) {
                            print("Signed in");
                            wrongpass=false;
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                            setState(() {
                              wrongpass=true;
                            });
                          });

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ),);
                        },
                        child: const Text('Sign In',style: TextStyle(
                          fontFamily: 'Redhat',
                          fontSize: 22,
                        ),),
                      ),
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.69),
                  margin: EdgeInsets.only(top: 20),

                  child: Text('OR',
                    style: TextStyle(
                      fontFamily: 'Redhat',
                      fontSize: 18,

                    ),)

                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                signInWithGoogle(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0.7,
                  ),],

                  color: Colors.white
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.77,left: 13,right: 13),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'images/google_logo.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text('Sign In with Google    ',
                      style: TextStyle(
                        fontFamily: 'Convergence',
                        // fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),)
                    ,



                  ],
                ),


              ),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.94,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Pageregister();
                        }
                        ),
                      );
                    },
                    child: const Text('New Register',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Convergence',
                      ),),),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) {
                         return Forgot();
                       }
                       ),
                     );
                   },
                   child: const Text('Forgot Password?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Convergence',
                    ),),)

                ],
              )
            )

          ],

        ),
      ),
    );
  }
  void showSnackBar(BuildContext context ,String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }
  Future<void> signInWithGoogle(BuildContext context) async {

    try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);


        }

    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
}

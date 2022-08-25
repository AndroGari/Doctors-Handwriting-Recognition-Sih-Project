import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swathyavardhak/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swathyavardhak/main.dart';
import 'package:swathyavardhak/verifyemail.dart';
class Pageregister extends StatefulWidget {
  const Pageregister({Key? key}) : super(key: key);


  @override
  State<Pageregister> createState() => _PageregisterState();
}

class _PageregisterState extends State<Pageregister> {
  final blue1 = const Color(0xff0d0f35);
  TextEditingController _username = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _useremail = TextEditingController();
  TextEditingController _userpass1 = TextEditingController();
  TextEditingController _userpass2 = TextEditingController();

  bool toggle1=true;
  bool toggle2= true;
  bool sametoggle=false;
  bool passtoggle = false;
  int charLength = 0;

  _onChanged2(String value) {
    setState(() {
      charLength = value.length;
    });
  }
  _onChanged1(String value){
    setState(() {
      if(_userpass1.text == _userpass2.text){
        sametoggle=false;
      }
      else{
        sametoggle=true;
      }
    });
  }


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
            Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.17,
                left: 40),
                child: const Text('Registration',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Redhat',
                  ),)
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,left: 35,right: 35),
              width: MediaQuery.of(context).size.width*0.80,
              height: 310,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/white.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Container(

                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _username,
                      // maxLines: 2,
                      maxLength: 20,
                      decoration: InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 70),
                    child: TextField(
                    onTap: (){
                       setState(() {
                 sametoggle=false;
                 passtoggle=false;
                            });},
                      enableSuggestions: true,
                      controller: _useremail,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 120),
                    child: TextField(
                      onTap: (){
                        setState(() {
                          passtoggle=true;
                        });

                      },
                      onChanged: _onChanged2,
                      controller: _userpass1,
                      obscureText: toggle1,
                      decoration: InputDecoration(
                        suffixIcon:   IconButton(
                            icon: toggle1
                                ? const Icon(Icons.visibility)
                                : const Icon(
                              Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                toggle1 = !toggle1;
                              });
                            }),

                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 153),
                    child: passtoggle && charLength<8 ? Text('Password should be 8 charachters long',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blueGrey,
                      ),)
                        :Text(""),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 170),
                    child: TextField(
                      onChanged: _onChanged1,
                      onTap: (){
                        setState(() {
                          sametoggle=true;
                        });

                      },
                      controller: _userpass2,
                      obscureText: toggle2,
                      decoration: InputDecoration(
                        suffixIcon:   IconButton(
                            icon: toggle2
                                ? const Icon(Icons.visibility)
                                : const Icon(
                              Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                toggle2 = !toggle2;
                              });
                            }),
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 203),

                    child: sametoggle? Text('Please make sure your passwords match',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                    ),)
                        :Text(""),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35,right: 35),
                    margin: EdgeInsets.only(top: 220),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: _phonenumber,
                      decoration: InputDecoration(
                  counterText: '',
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(



                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.77),
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
                          if (_userpass1.text == _userpass2.text ) {
                            addUser();
                            // insertData(_username.text, _phonenumber.text , _useremail.text);
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                email: _useremail.text,
                                password: _userpass1.text).then((value) {
                              print("Created new account");

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => VerifyEmail()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          }
                        },
                        child: const Text('Create Account',style: TextStyle(
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
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.93,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Mylogin();
                          }
                          ),
                        );
                      },
                      child: const Text('Already a user! Login',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Redhat',
                        ),),)
                ),
              ],
            )
          ],
        ),
      ),

    );

  }

  Future<void> addUser() async {


    final user = FirebaseFirestore.instance.collection('users').doc(_useremail.text);
    final json ={
      'Name': _username.text,
      'Email': _useremail.text,
      'phone number': '+91'+_phonenumber.text,
    };
    await user.set(json)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



}


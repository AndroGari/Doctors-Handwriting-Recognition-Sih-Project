import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swathyavardhak/login.dart';
import 'package:swathyavardhak/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  int num=0;
  final blue1 = const Color(0xff0d0f35);
  bool j=true;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }),
                );
              },
              icon: Icon(Icons.home_outlined),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.search),
              iconSize: 30,
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Settings();
                  }),
                );
              },
              icon: Icon(Icons.settings),
              iconSize: 30,
            ),

            const SizedBox(),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.blueGrey,
        title: Text('Demo'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(



                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
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
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed out");
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Mylogin()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });


                    },
                    child: const Text('Sign out',style: TextStyle(
                      fontFamily: 'Redhat',
                      fontSize: 22,
                    ),),
                  ),
                )
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed:(){
          setState(() {
            num<10? num++:num=0;
            j=!j;
          });
        },
        backgroundColor: j? Colors.green: Colors.blue,

        child: Icon( !j? Icons.add_a_photo : Icons.access_time_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swathyavardhak/login.dart';
import 'package:swathyavardhak/main.dart';
class SettingSwas extends StatefulWidget {
  const SettingSwas({Key? key}) : super(key: key);

  @override
  State<SettingSwas> createState() => _SettingSwasState();
}

class _SettingSwasState extends State<SettingSwas> {
  @override
  int num=0;
  final blue1 = const Color(0xff0d0f35);
  bool j=true;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 42,
        elevation: 85,
        color: blue1,
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
              icon: Icon(Icons.home_outlined,
                color: Colors.white,
              ),
              iconSize: 35,
            ),
            Container(
              height: 60,
              width: 60,

              // padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                boxShadow: const [BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1.5,
                ),],
                shape: BoxShape.circle,
                color: Color.fromRGBO(0, 178, 255, 100),
                // color: Color.fromRGBO(132, 29, 210, 72),
              ),
              child:
              Icon(
                Icons.camera_alt,
                size: 35,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SettingSwas();
                  }),
                );
              },
              icon: Icon(Icons.settings,
                color: Colors.white,),
              iconSize: 30,
            ),

            const SizedBox(),
          ],
        ),
      ),
      appBar: AppBar(

        automaticallyImplyLeading: false,
        // centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 12),
            child: PopupMenuButton(

              // child: Icon(Icons.list,
              // size: 30,),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("FAQ'S"),
                ),
                // PopupMenuItem(
                //   child: Text("Flutter.io"),
                // ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed out");
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Mylogin()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    },
                      child: Text("Log out")),
                ),
              ],
            ),
          )

        ],
        backgroundColor: blue1,
        title: Text('  Settings',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: 'Convergence'
        ),),
      ),
      body: Column(
        children: [
          Center(

          ),
        ],
      ),

    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swathyavardhak/login.dart';
import 'package:swathyavardhak/setting.dart';
import 'package:swathyavardhak/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int num=0;
  double Text_size=23;
  final blue1 = const Color(0xff0d0f35);
  bool j=true;
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
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
                height: 80,
                width: 80,
                padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.pink, Colors.blue],
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 45,
                ),
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
                icon: Icon(Icons.settings,
                color: Colors.white,),
                iconSize: 30,
              ),

              const SizedBox(),
            ],
          ),
        ),

        body: Column(
          children: [


            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(0, 178, 255, 100),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.22,left: 13,right: 13),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Text('Prescription',
                  style: TextStyle(
                    fontFamily: 'Convergence',
                    fontWeight: FontWeight.w600,
                    fontSize: Text_size,
                  ),)
                  ,
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/prescription.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )


                ],
              ),


            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(0, 178, 255, 100),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,left: 13,right: 13),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Text('Medical History',
                    style: TextStyle(
                      fontFamily: 'Convergence',
                      fontWeight: FontWeight.w600,
                      fontSize: Text_size,
                    ),)
                  ,
                  Container(
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/medical.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )


                ],
              ),


            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(0, 178, 255, 100),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,left: 13,right: 13),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Text('Lab Results',
                    style: TextStyle(
                      fontFamily: 'Convergence',
                      fontWeight: FontWeight.w600,
                      fontSize: Text_size,
                    ),)
                  ,
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/lab result.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )


                ],
              ),


            ),
          ],
        ),

      ),
    );
  }
}

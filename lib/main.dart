import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swathyavardhak/presciptions.dart';
import 'package:swathyavardhak/setting.dart';
import 'package:swathyavardhak/splash.dart';

void main() async {
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
  int num=0;
  double Text_size=23;
  final blue1 = const Color(0xff0d0f35);
  bool j=true;
  late File _image;
  final imagePicker = ImagePicker();
  final  _auth =  FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();
  // your_async_method () async {
  //
  //   final documents = await FirebaseFirestore.instance.collection('users').doc(user.email);
  //   final userObject = documents.document.first.data;
  //   print(userObject);
  // }

    Future getImage() async {
    final image = await imagePicker.pickImage(
        source: ImageSource.camera);
    setState(() {

      _image = File(image!.path);
    });
  }
  @override

  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
              GestureDetector(
                onTap:   getImage,
                child: Container(
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

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12 , left: 20,right: 20
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("HI!   ${data['Name']}"

                      ,

                        // + nam_email!

                    style: TextStyle(
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


            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Prescriptions();
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(0, 178, 255, 100),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.09,left: 13,right: 13),
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
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Desgining();
                  }),
                );
              },
              child: Container(
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
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Lab_Report();
                  }),
                );
              },
              child: Container(
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
                    Text('Lab Reports',
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
            ),
          ],
        ),

      ),
    );
  }

  return Scaffold(
    body: Center(

      child: Container(
        height: 80,
        width: 80,
        child: CircularProgressIndicator(
          strokeWidth: 8,
        ),
      ),
    ),
  );
},
);
  }
}

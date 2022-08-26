import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:swathyavardhak/Firebase_api.dart';
import 'package:swathyavardhak/register.dart';

import 'main.dart';
class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
bool p1=false;
bool p2=false;
bool p3= false;
bool p4 =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12 , left: 20,right: 20
                ),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("  Prescriptions"
                        ,style: TextStyle(
                          fontFamily: 'Convergence',
                          fontWeight: FontWeight.w600,

                          fontSize: 32,
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
              Container(
                margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                height: 60,

                decoration: BoxDecoration(
                border: Border.all(
    color: Colors.black,
    ),
                  borderRadius : BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(196, 196, 196, 1),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Prescription 1',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Convergence'
                    ),),
                    Container(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            p1=!p1;
                            p2=false;
                            p3=false;
                            p4=false;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined,
                        size: 35,),
                      ),
                    )
                  ],
                ),
              ),
              if(p1==true)
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 400,
                  width: 400,
                  color: Colors.transparent,
                  child: Image.asset('images/img.png'),
                ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                height: 60,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius : BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(196, 196, 196, 1),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Prescription 2',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Convergence'
                      ),),
                    Container(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            p1=false;
                            p2=!p2;
                            p3=false;
                            p4=false;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined,
                          size: 35,),
                      ),
                    )
                  ],
                ),
              ),
              if(p2==true)
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 400,
                  width: 400,
                  color: Colors.transparent,
                  child: Image.asset('images/1st.jpg'),
                ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                height: 60,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius : BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(196, 196, 196, 1),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Prescription 3',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Convergence'
                      ),),
                    Container(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            p1=false;
                            p2=false;
                            p3=!p3;
                            p4=false;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined,
                          size: 35,),
                      ),
                    )
                  ],
                ),
              ),
              if(p3==true)
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 400,
                  width: 400,
                  color: Colors.transparent,
                  child: Image.asset('images/1st.jpg'),
                ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                height: 60,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius : BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(196, 196, 196, 1),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Prescription 4',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Convergence'
                      ),),
                    Container(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            p1=false;
                            p2=false;
                            p3=false;
                            p4=!p4;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined,
                          size: 35,),
                      ),
                    )
                  ],
                ),
              ),
              if(p4==true)
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 400,
                  width: 400,
                  color: Colors.transparent,
                  child: Image.asset('images/1st.jpg'),
                )
            ],
          ),
        ],
      ),

    );
  }
}

class Desgining extends StatelessWidget {
  const Desgining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Container(
          height: 90,
          width: 90,
          child: CircularProgressIndicator(
            strokeWidth: 8,
          ),
        ),
      ),
    );
  }
}

class Lab_Report extends StatefulWidget {
  const Lab_Report({Key? key}) : super(key: key);

  @override
  State<Lab_Report> createState() => _Lab_ReportState();
}

class _Lab_ReportState extends State<Lab_Report> {
  final blue1 = const Color(0xff0d0f35);
File? file;

  Future SelectFileFromStorage() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    // if (result != null)
    // setState(() {
    //   pickedFile = result.files.first;
    // });
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null) return;
      final path = result.files.single.path!;
      setState(() {
        file = File(path);
      });


  }
  Future Upload() async{
    if(file==null) return;
    final filename = basename(file!.path);
    final destination = 'files/$filename';
    FirebaseApi.uploadFile(destination, file!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20,bottom: 20),
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: Upload,
          child: Icon(Icons.cloud_upload,
          size: 35,),
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
                  child: Text("  View section"
                    ,style: TextStyle(
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
          file!=null?
             Container(
               margin: EdgeInsets.only(top: 30),
              height: 400,
              width: 400,
              color: Colors.transparent,
              child: Image.file(
                File(file!.path),
                // width: double.infinity,
                // fit: BoxFit.cover,
              ),
            ) :
          Container(
            margin: EdgeInsets.only(top: 30 , left: 2 , right: 2),
            height: 400,
            width: 400,
            // color: Colors.grey,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                )
              ),
            child: Center(
              child: Text("Image Area",
              style: TextStyle(
                fontFamily: 'Convergence',
                fontSize: 30,
              ),),
            )
          ),

            Container(),
          GestureDetector(
            onTap: SelectFileFromStorage,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width*0.8,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
              ),
              child: Center(
                child: Text('Select File',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Convergence'
                ),),
              ),
            ),
          ),



        ],
      ),

    );
  }
}


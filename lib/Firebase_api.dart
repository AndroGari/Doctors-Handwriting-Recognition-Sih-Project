import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
class FirebaseApi{
  static UploadTask? uploadFile(String Destination , File file){
    try{
      final ref = FirebaseStorage.instance.ref(Destination);
      return ref.putFile(file);
    } on FirebaseException catch (e){
      print(e.toString());
      return null;
    }
  }
}
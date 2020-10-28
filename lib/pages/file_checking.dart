import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:letschat/pages/profile_info.dart';

class FileChecking extends StatefulWidget{
  static String id = 'file_checking';

  @override
  _FileCheckingState createState() {
    return _FileCheckingState();
  }
}

class _FileCheckingState extends State<FileChecking>{
  @override

  Widget build(BuildContext context){
    return Container(
      color: Color(0xFF666666),
      child: AlertDialog(
        elevation: 5,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.only(right: 30),
        contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 20),
        title: Container(
          height: 140,
          width: double.infinity,
          color: Color(0xFF1EBEA6),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.contacts, color: Colors.white, size: 60),
                SizedBox(width: 30,),
                Icon(Icons.add, color: Colors.white, size: 30),
                SizedBox(width: 30,),
                Icon(Icons.folder, color: Colors.white, size: 30)
              ],
            ),
          ),
        ),
        content: Text('To find and restore your backup from Google Drive, allow WhatsApp access to your contacts and your device\'s photos, media, and files),',
      style: TextStyle(fontSize: 14),
        textAlign: TextAlign.justify,),
        actions: [
          TextButton(onPressed: (){}, child: Text('NOT NOW',
          style: TextStyle(
            color: Color(0xFF1EBEA6),
            fontWeight: FontWeight.bold
          ),)),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, ProfileInfo.id);
          },
              child: Text('CONTINUE',
            style: TextStyle(
                color: Color(0xFF1EBEA6),
                fontWeight: FontWeight.bold
            ),)),
        ],
      ));
  }
}


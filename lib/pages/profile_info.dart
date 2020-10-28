import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letschat/pages/main_page.dart';

class ProfileInfo extends StatefulWidget {
  static String id = 'profile_info';
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

//  EmojiPicker showEmoji(){
//    return EmojiPicker(
//        onEmojiSelected: (emoji, category){
//          print(emoji);
//        });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text('Profile info',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF00838F)
            ),),
        ),
      ),
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(20),
        child: Center(child: Column(
          children: [
            Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: Text('Please provide your name and an optional profile photo',
                      style: TextStyle(color: Colors.black45, fontSize: 15),),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFFECEFF1),
                    radius: 50,
                    child: Icon(Icons.add_a_photo,
                      size: 40,
                    color: Color(0xFFB0BEC5),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                              hintText: 'Type your name here',
                              hintStyle: TextStyle(color: Colors.black45, fontSize: 14, )
                          ),
                        ),
                      ),
                  GestureDetector(
                      child: Icon(Icons.insert_emoticon_sharp, color: Colors.grey,),
                  onTap: (){})
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, MainPage.id);
              },
              child: Card(
                elevation: 2.0,
                child: Container(
                  height: 45,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Color(0xFF00CC3F),
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(
                    child: Text('NEXT',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                      ),),
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
      )),
    );
  }
}

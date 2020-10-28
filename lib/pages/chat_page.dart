import 'dart:ui';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class ChatPage extends StatefulWidget {
  static String id = 'chat_page';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {


  TextEditingController _textEditingController = TextEditingController();
  List<String> messageList = ['I believe I can Fly'];
  List<Widget> getMessage() {
    List<Widget> messageText =[];
    for(var i in messageList.reversed){
      messageText.add(MessageBubbles(message: i,));
    }
    return messageText;
  }
  int wordsNum;
  String wordText;

  @override
    Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
            child: CircleAvatar(
              backgroundColor: Color(0xFFECEFF1),
              radius: 1,
              child: Icon(Icons.perm_identity, size: 20, color: Colors.white,),
            ),
          ),
          backgroundColor: Color(0xFF075E54),
          title: Text('Idris',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.videocam),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.call),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Container(
         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: kBackgroundImage,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  reverse: true,
                  children: getMessage(),
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      width: MediaQuery.of(context).size.width *0.83,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width *0.75,
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.insert_emoticon, color: Color(0xFF898E93),),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: FaIcon(FontAwesomeIcons.paperclip,
                                          color: Color(0xFF898E93),)),
                                  ),
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFB5B5B5)
                                  )
                              ),
                              onChanged: (word){
                                setState(() {
                                  wordsNum = word.length;
                                  wordText = word;
                                });
                              },
                              onSubmitted: (text){
                                setState(() {
                                  wordText = text;
                                });
                              },
                            ),
                          ),
                          Icon(Icons.camera_alt, color: Color(0xFF888E92))
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFF00897B),
                          child: wordsNum ==0? Icon(Icons.mic, color: Colors.white, size: 25,):
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  wordsNum = 0;
                                  _textEditingController.clear();
                                  messageList.add(wordText);
                                });
                              },
                              icon: Icon(Icons.send, color: Colors.white, size: 20,)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBubbles extends StatelessWidget {

  MessageBubbles({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Bubble(
              nip: BubbleNip.rightTop,
              color: Color(0xFFE1FFC7),
              child: RichText(
                text: TextSpan(
                  children: [TextSpan(text: message,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),),
                    TextSpan(text: '  ${DateTime.now().hour} : ${DateTime.now().minute}',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500]
                    ),)
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


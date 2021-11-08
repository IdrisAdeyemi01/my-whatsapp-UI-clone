import 'package:flutter/material.dart';
import 'package:letschat/pages/chat_page.dart';
import 'package:letschat/pages/file_checking.dart';
import 'package:letschat/pages/main_page.dart';
import 'package:letschat/pages/phone_number_2.dart';
import 'package:letschat/pages/profile_info.dart';
import 'pages/entering_page.dart';
import 'pages/phone_number_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ChatPage.id: (context) => ChatPage(),
        EnteringPage.id: (context) => EnteringPage(),
        FileChecking.id: (context) => FileChecking(),
        MainPage.id: (context) => MainPage(),
        PhoneNumber1.id: (context) => PhoneNumber1(),
        PhoneNumber2.id: (context) => PhoneNumber2(),
        ProfileInfo.id: (context) => ProfileInfo()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: EnteringPage.id,
    );
  }
}

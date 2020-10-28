import 'package:flutter/material.dart';
import 'package:letschat/pages/file_checking.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../constants.dart';

class PhoneNumber2 extends StatefulWidget {
  static String id = 'phone_number_2';
  @override
  _PhoneNumber2State createState() => _PhoneNumber2State();
}

class _PhoneNumber2State extends State<PhoneNumber2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text('Verify +234 802 253 1950',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF2E7F76)
            ),),
        ),
        actions: [
          Icon(Icons.more_vert,
            color: Colors.black,)
        ],
      ),
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

        child: Center(
          child: Column(
              children: [
                FittedBox(
                  child: RichText(
                    textAlign: TextAlign.center ,
                      text: TextSpan(
                    children: [
                      TextSpan(text: 'Waiting to automatically detect an SMS sent to \n', style: TextStyle(
                          color: Colors.black54, fontSize: 16)),
                      TextSpan(text: '+234 802 253 1950. ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                      TextSpan(text: 'Wrong number?', style: TextStyle(color: Colors.blue, fontSize: 16))
                    ]
                  )),
                ),
//                Text('Waiting to automatically detect an SMS sent to \n+234 802 253 1950. Wrong number?',
//                  textAlign: TextAlign.center,),
                FittedBox(
                  child: Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.green))),
                    child: PinCodeTextField(
                      autoFocus: true,
                      onCompleted: (pin){
                        Navigator.pushNamed(context, FileChecking.id);
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 50,
                        fieldWidth: 40,
                      ),
                      keyboardType: TextInputType.phone,
                      length: 6,
                      appContext: context,
                      onChanged: (value){},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Enter 6-digit code',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45
                    ),),
                ),
                Container(
                  child: Column(
                 children: [
                   ListTile(
                     leading: Icon(Icons.sms, color: Colors.black54),
                     title: Text('Resend SMS', style: TextStyle(color: Colors.black54),),
                     trailing: Text('2:01', style: TextStyle(color: Colors.black54),),
                   ),
                   Divider(
                     color: Colors.black54,
                   ),
                   ListTile(
                     leading: Icon(Icons.call, color: Colors.black54),
                     title: Text('Call me', style: TextStyle(color: Colors.black54),),
                     trailing: Text('1:01', style: TextStyle(color: Colors.black54,),
                   ),
                 ),
                  ])
                ),
              ]
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letschat/constants.dart';
import 'package:letschat/pages/phone_number_1.dart';

class EnteringPage extends StatefulWidget {
  static String id = 'entering_page';
  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text('Welcome to WhatsApp',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF178B7E)
                    )
                  ),
                ),
                Image.asset('images/page_1_asset.png'),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Read our ', style: TextStyle(color: Colors.black45)
                              ),
                              TextSpan(
                                text: ' Privacy Policy. ', style: TextStyle(color: Colors.blue)
                              ),
                              TextSpan(
                                  text: 'Tap \'Agree and continue\' to \naccept the ', style: TextStyle(color: Colors.black45)
                              ),
                              TextSpan(
                                  text: 'Terms of Service.', style: TextStyle(color: Colors.blue)
                              ),
                            ]
                          ),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.pushNamed(context, PhoneNumber1.id);
                        },
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFF00CC3F),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text('AGREE AND CONTINUE',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Column(
                  children: [
                    Text('from'),
                    Text('FACEBOOK',
                    style: TextStyle(
                      color: Color(0xFF00CA53)
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

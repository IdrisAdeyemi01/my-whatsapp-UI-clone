import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letschat/constants.dart';
import 'package:letschat/country_codes.dart';
import 'package:letschat/pages/phone_number_2.dart';

class PhoneNumber1 extends StatefulWidget {
  static String id = 'phone_number_1';

  @override
  _PhoneNumber1State createState() => _PhoneNumber1State();
}

class _PhoneNumber1State extends State<PhoneNumber1> {

  String _value = 'Nigeria';
  String theCountryCode = '+234';
  List getNationsList(){
    List countriesList = getList();
    List<DropdownMenuItem<String>> dropdowns = [];
    List countryCode = [];
    for(var i in countriesList){
      dropdowns.add(
          DropdownMenuItem<String>(child: Center(
            child: Text(i[0],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),),
          ), value: i[0],)
      );
      countryCode.add(i[1]);
    }
    return [dropdowns, countryCode];
  }
  String getCode(val){
    List countries = [];
    for(var i in getList()){
      countries.add(i[0]);
    }
    int position = countries.indexOf(val);
    return getNationsList()[1][position];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text('Enter your phone number',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF009688)
          ),),
        ),
        actions: [
          Icon(Icons.more_vert,
          color: Colors.black,)
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

          child: Center(
            child: Column(

              children: [
                RichText(
            textAlign: TextAlign.center,
                 text: TextSpan(
                   children: [
                     TextSpan(text: 'WhatsApp will send an SMS message to verify your \nphone number. ',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black
                         )),
                     TextSpan(text: 'What\'s my number?',
                         style: TextStyle(color: Colors.blue, fontSize: 16,))
                   ],
                 )
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green))
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _value,
                        items: getNationsList()[0],
                        onChanged:(value) {
                  setState(() {
                  _value = value;
                  theCountryCode = getCode(_value);
                  });
                  }),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.green, ))
                        ),
                        child: FittedBox(child: Text('$theCountryCode', textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 14),)),
                      ),
                      Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.green))),
                        child: TextField(

                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            //enabledBorder: Border(borderSide: BorderSide(color: Color(0xFF00887A))),
                            focusColor: Colors.green,
                            hintText: 'phone number',
                            hintStyle: TextStyle(color: Colors.black54, fontSize: 14)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Carrier SMS charges may apply',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45
                  ),),
                ),
                Spacer(),
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, PhoneNumber2.id);
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
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'You must be ',  style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14
                        )),
                        TextSpan(text: 'at least 16 years old ', style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14
                        ),),
                        TextSpan(text: 'to register. Learn how \nWhatsApp works with the ',  style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14
                        )),
                        TextSpan(text: 'Facebook Companies.', style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14
                        ),),
                      ]
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

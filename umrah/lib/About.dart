import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umrah/MyColors.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:  Scaffold(
        appBar: AppBar(
          title: const Text(
            'لنعتمر',
          ),

          backgroundColor: mainColor,

        ),
        body:  Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: textBorder,
                  width: 2.0
              )
          ),
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  const [
                Text(
                "ِعن التطبيق",
                 style:  TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,

                 ),
                 textAlign: TextAlign.center,
               ),

            ],
          )
          ,
        ),
      ),
    );
  }
}

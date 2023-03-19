import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umrah/MyColors.dart';

class DuaaOutline extends StatelessWidget {
  const DuaaOutline({Key? key}) : super(key: key);
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
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body:  Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: textBorder,
            width: 2.0
          )
        ),
        margin: EdgeInsets.all(20),

        //child: ,
      ),
    ),
    );
  }
}
/// const DuaaText()
class DuaaText extends StatefulWidget {
  const DuaaText({Key? key}) : super(key: key);

  @override
  State<DuaaText> createState() => _DuaaTextState();
}

class _DuaaTextState extends State<DuaaText> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


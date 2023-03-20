
import 'package:flutter/material.dart';
import 'package:umrah/MyColors.dart';
import 'package:umrah/databaseService.dart';


class DuaaOutline extends StatelessWidget {
  DuaaOutline({Key? key, required this.tableName}) : super(key: key);
  final String tableName;

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

        child: DuaaText(tableName: this.tableName),
      ),
    ),
    );
  }
}
/// const DuaaText()
class DuaaText extends StatefulWidget {
  const DuaaText( {Key? key, required this.tableName}) : super(key: key);
  final String tableName;

  @override
  State<DuaaText> createState() => _DuaaTextState(tableName: this.tableName);
}

class _DuaaTextState extends State<DuaaText> {
  _DuaaTextState( {Key? key, required this.tableName}) ;
  final String tableName;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: PrayerText(tableName),
      ),
    );
  }

  Widget PrayerText(String tableName){

    List res = dataBaseService().getData(tableName);
    int i;

    Column column = Column();


    for ( i=0; i<res.length; i++){
      column.children.add(
        Text(res[i]+
            '\n',
        )
      );
    }

    return column;
  }
}


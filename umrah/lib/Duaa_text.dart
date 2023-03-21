
import 'package:flutter/material.dart';
import 'package:umrah/Duaa.dart';
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
        width: double.infinity,
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
  State<DuaaText> createState() => _DuaaTextState(this.tableName);
}

class _DuaaTextState extends State<DuaaText> {
  String tableName;
  _DuaaTextState(this.tableName);

  late Future<List<Duaa>> _futureData = SQLiteDbProvider.db.fetch(tableName); ///get the data


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( //TODO this doesnt fill up the screen
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              SizedBox(
                height: 20,
              ),


              Text(
                tableName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
              ),
              GeneratePrayerText(tableName),

            ],
          )

      ),
    );
  }

 Widget GeneratePrayerText(String tableName){

    return FutureBuilder<List<Duaa>>(
        future: _futureData, 
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            List<Duaa> items = snapshot.data!;
            /*return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){
                  Duaa item = items[index];

                  return Text('$item');
                }
            );
          }
          return CircularProgressIndicator();
        },*/
            print('pka');
            //print(snapshot.data.toString());
            return Text(snapshot.data.toString());
          }
          return CircularProgressIndicator();
        }
    );
  }



}


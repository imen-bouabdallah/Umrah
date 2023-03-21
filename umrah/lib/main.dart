import 'package:flutter/material.dart';
import 'package:umrah/Duaa_text.dart';
import 'package:umrah/MyColors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'لنعتمر',

      theme: ThemeData(
        primarySwatch: buildMaterialColor(mainColor), //app Bar color
        appBarTheme: AppBarTheme(
          color: mainColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        )
      ),

      home: Directionality(
        textDirection: TextDirection.rtl,
        child:  Scaffold(
        backgroundColor: backgdColor ,
        appBar: AppBar(
          title:  const Text(
            'لنعتمر',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: mainColor,
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),
            )
          ],
        ),

        body:  MyHomePage(),
      ),
    ),

    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {


    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///So that the rest won't be too close to the app bar
          const SizedBox(
            height: 20.0,
          ),

          const Center(
            ///The title
            child: Text(
              'ادعية العمرة',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),

          const SizedBox(
            height: 20.0,
          ),
          ///so that it starts display from right to left since it's in arabic
          Directionality(
          textDirection: TextDirection.rtl,
          child: ///the gridView to display the options
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(20.0),
                ///number of items per row
                crossAxisCount: 3,
                ///spqcing
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 8.0,

                childAspectRatio: (1 / 1.2),
                children: <Widget>[
                  itemCard("دعاء المسافر", "assets/icons/kaaba_travel.png"),
                  itemCard("دعاء الإحرام", "assets/icons/muslim.png"),
                  itemCard("دعاء النظرة الاولى", "assets/icons/kaaba.png"),
                  itemCard("الحجر الأسود", "assets/icons/stone.png"),
                  itemCard("ادعية الطواف", "assets/icons/tawaf.png"),
                  itemCard("مقام ابراهيم", "assets/icons/kaaba.png"),
                  itemCard("الصفا و المروة", "assets/icons/safa_marwa.png"),
                  itemCard("أدعية منوعة", "assets/icons/madina.png"),
                  itemCard("أدعية منوعة", "assets/icons/duaa.png"),

                ],
              ),
            ),
          ),
        ],
    );
  }

  Widget itemCard(String title, String icon){ //TODO add tap function to each card
    return InkWell( ///to make it clickable
      onTap: () =>{
        Navigator.push(context, MaterialPageRoute(builder: (context) => DuaaOutline(tableName: title)) ),
      }, ///handle the clics
      child: Container(
        // padding: const EdgeInsets.all(20), ///since it's in a grid view it'll do the job
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 50,

            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

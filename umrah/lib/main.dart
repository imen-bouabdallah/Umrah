import 'package:flutter/material.dart';
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

      home: const MyHomePage(title: 'لنعتمر'),

      theme: ThemeData(
        primarySwatch: buildMaterialColor(mainColor), //app Bar color
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget itemCard(String title, String icon){ //TODO add tap function to each card
    return InkWell( ///to make it clickable
      onTap: () =>{}, ///handle the clics
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
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),

        actions: <Widget>[
          IconButton(
              onPressed: () => {},
              icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///So that the rest won't be too close to the app bar
          const SizedBox(
            height: 20.0,
          ),


          ///the gridView to display the options
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(20.0),
              ///number of items per row
              crossAxisCount: 3,
              ///spqcing
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 8.0,
              children: <Widget>[
                itemCard("testing", "assets/icons/kaaba.png"),
                itemCard("testing", "assets/icons/tawaf.png"),
                itemCard("testing", "assets/icons/kaaba.png"),
                itemCard("testing", "assets/icons/kaaba.png"),
                itemCard("testing", "assets/icons/kaaba.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

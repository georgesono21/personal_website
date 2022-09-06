// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 2), vsync: this);
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(1.0, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(children: <Widget>[
                  Text("Hello and welcome to my personal website! I am",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SlideTransition(
                    position: offsetAnimation,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("George Sono",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("(曽野良信)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Currently, I am a second-year Computer Science student at UC Santa Cruz!",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                  //creates hyperlink text to website
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/800px-LinkedIn_logo_initials.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onTap: () {
                                    launch(
                                        "https://www.linkedin.com/in/yoshinobu-sono/");
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                  //creates hyperlink text to website
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onTap: () {
                                    launch("https://github.com/georgesono21");
                                  }),
                            )
                          ],
                        ),
                      )),
                  Column(
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            decoration: TextDecoration.underline),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 750,
                          child: Text(
                            "I am an aspiring software engineer seeking internships for 2023 Spring/Summer. Moving from Japan, I came to the United States for better oppurtuniies in the field of tech. With learning about economics and finance as one of my primary hobbies, I aim to work in the financial tech industry with IT.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

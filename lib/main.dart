// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:invert_colors/invert_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "George Sono's Website",
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
      home: const MyHomePage(title: "George Sono's Website"),
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
    final currentWidth = MediaQuery.of(context).size.width;
    final mobileWidth = 800;

    return Scaffold(
        backgroundColor:
            currentWidth < mobileWidth ? Colors.grey[900] : Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                heightFactor: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(children: <Widget>[
                    SizedBox(height: 80),
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
                              Text("Links:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic)),
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
                                    child: InvertColors(
                                      child: Image.network(
                                        'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    onTap: () {
                                      launch("https://github.com/georgesono21");
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: InkWell(
                                    //creates hyperlink text to website
                                    child: Image.network(
                                      'https://t3.ftcdn.net/jpg/03/77/85/04/360_F_377850455_Gk0rRBzegH6YX9SZK9YbgyYyLwrVb9zi.jpg',
                                      width: 50,
                                      height: 50,
                                    ),
                                    onTap: () {
                                      launch(
                                          "https://docs.google.com/document/d/149jjzXpJzzGJ08tuEioL2UVYTqkGEsHJ/edit?usp=sharing&ouid=104105135239584765519&rtpof=true&sd=true");
                                    }),
                              ),
                            ],
                          ),
                        )),
                    Column(
                      children: const <Widget>[
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: const [
                                Text("Programming:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    "- Python\n- Dart\n- Flutter\n- RISC-V Assembly\n- Javascript\n- HTML/CSS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                            SizedBox(width: 70),
                            Column(
                              children: const [
                                Text("Tools & Software:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    "- Git\n- Microsoft Excel\n- Microsoft Office",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ],
                            ),
                            SizedBox(width: 70),
                            Column(
                              children: const [
                                Text("Human Languages:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    "- English (native)\n- Japanese (conversational)",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Column(children: <Widget>[
                      //projects column
                      Text(
                        "Personal Projects",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            decoration: TextDecoration.underline),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 750,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 700,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text("PlateBuddy",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "- Developed a webapp for home gyms that calculates the weight needed on each side of a barbell \n- Provides what weights are possible, given input by the type and amount of plates the user has in their gym \n- UI/UX made in Flutter (Dart) and scripts are written in Python (using dynamic programming)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 750,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 700,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text("Stock Trading Bot",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "- Created a Python trading program with the Alpaca API and Python\n- Executes buy and sell orders (will eventually incorporate Technical Analysis) \n- Program was tested against a real time simulation of the NYSE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ])
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}

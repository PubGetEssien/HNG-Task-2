import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: prefer_typing_uninitialized_variables
  String url = 'https://internship.zuri.team/';
  final nameController = TextEditingController();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Your Name Is"),
      content: Text(nameController.text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 50,
                child: Image(
                  image: AssetImage('assets/images/hng_logo.png'),
                ),
              ),
              // Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Hi, what's your name?",
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueAccent,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.send),
                          onPressed: () {
                            showAlertDialog(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () => {launch(url)},
                  child: Text('Vist the HNG Site'))
            ],
          ),
        ),
      ),
    );
  }
}

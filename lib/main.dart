import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

var shows = ['1. Squid Game', '2. Seinfeld', '3. The Witcher', '4. How I Met Your Mother'];
var numb;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Shows to watch!';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Column(
          children: [showsList(), MyAlert(),],
        )
      ),
    );
  }
}

class showsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(shows[0]), Text(shows[1]), Text(shows[2]),Text(shows[3]),
          TextField(
            decoration: const InputDecoration(
                hintText: 'Enter the number of the show you want to watch'
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (String text){
              numb = int.parse(text);
            },
          ),
        ]
    );
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: Text('Submit'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Chosen Show"),
    content: Text(shows[numb - 1]),
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

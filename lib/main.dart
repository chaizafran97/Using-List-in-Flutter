import 'package:flutter/material.dart';

void main() {
  var shows = ['1. Squid Game', '2. Seinfeld', '3. The Witcher', '4. How I Met Your Mother'];

  runApp(MaterialApp(
    title: 'Shows to watch!',
    home: Scaffold(
      appBar: AppBar(
          title:Text(
              'Shows to watch!'
          ),
      ),
        body: Column(
          children: [
            Text(shows[0]), Text(shows[1]), Text(shows[2]),Text(shows[3]),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter the number of the show you want to watch'
              ),
              keyboardType: TextInputType.number,
              onChanged: (int text){
                var num = text;
              },
            ),
            RaisedButton(child: Text('Submit'), onPressed: () => AlertDialog(
              title: Text(shows[num])
            ))
          ]
        )

    ),
  ));
}
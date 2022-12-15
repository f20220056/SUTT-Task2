import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:sutt_task2/api.dart';
import 'package:sutt_task2/firebase.dart';
import 'package:sutt_task2/train_details.dart';

late String from;
late String to;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome $userName'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: Image.asset('images/train_sutt (1).jpg'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'From',
                hintText: 'Enter origin station code',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                from = text;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'To',
                hintText: 'Enter destination station code',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                to = text;
              },
            ),
          ),
          FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            elevation: 8,
            icon: Icon(Icons.arrow_circle_right_outlined),
            label: Text('Search for Trains'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Screen2();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrainDetails(),
    );
  }
}

// FutureBuilder<Train>(
//                   future: response,
//                   builder: (context, snapshot) {
//                     return Text(snapshot.data!.data[1].trainName);
//                   },
//                 );

// late Future<Train> response;
//   @override
//   void initState() {
//     super.initState();
//     response = getTrain();
//   }
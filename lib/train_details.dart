import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:sutt_task2/api.dart';
import 'package:sutt_task2/home_page.dart';

class TrainDetails extends StatefulWidget {
  const TrainDetails({super.key});
  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  late Future<Train> response;
  @override
  void initState() {
    super.initState();
    response = getTrain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Screen1();
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.blue,
        title: const Text('Available Trains'),
      ),
      body: FutureBuilder<Train>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return ListView(
                  children: List<Widget>.generate(snapshot.data!.data.length,
                      (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Icon(Icons.train),
                                ),
                                Flexible(
                                  child: Text(
                                      '${snapshot.data!.data[index].trainName} : ${snapshot.data!.data[index].trainNumber}'),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      from.toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 3, 14, 168)),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                        snapshot.data!.data[index].departTime),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 10),
                                child: Icon(Icons.arrow_circle_right_rounded),
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      to.toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 3, 14, 168)),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                        snapshot.data!.data[index].arrivalTime),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }));
            } else {
              return Center(child: Container(child: 
              Text('Sorry! No Trains found', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)));
            }
          }
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 7,
          ));
        },
      ),
    );
  }
}

// FutureBuilder<Train>(
//       future: response,
//       builder: (context, snapshot) {
//         return Text(snapshot.data!.data[4].trainName);
//       },
//     );

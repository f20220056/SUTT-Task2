import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sutt_task2/firebase.dart';
import 'package:sutt_task2/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    if (flag == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 70),
                child:
                    Container(child: Image.asset('images/train_sutt (1).jpg'))),
            Container(
                child: Text('Login with Google',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        fontStyle: FontStyle.italic))),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: FloatingActionButton.extended(
                elevation: 10,
                onPressed: () async {
                  setState(() {
                    login(context);
                    flag = true;
                  });
                },
                icon: Image.asset('images/google_icon.jpeg'),
                label: const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
    else{
      return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 7,
          ));
    }
  }
}

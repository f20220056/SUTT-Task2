import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

String userName = "";

final FirebaseAuth fb = FirebaseAuth.instance;

Future<void> login(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? account = await googleSignIn.signIn();
  if (account != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await account.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await fb.signInWithCredential(authCredential);
    User? user = result.user;
    userName = user!.displayName!;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const Screen1();
        },
      ),
    );
  }
}

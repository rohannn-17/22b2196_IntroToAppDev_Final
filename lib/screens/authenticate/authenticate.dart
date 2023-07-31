import 'package:flutter/material.dart';
import 'package:flutter_fcm/screens/authenticate/register.dart';
import 'package:flutter_fcm/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool SignedIn = true;

  void toggleView() {
    setState(() {
      SignedIn = !SignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (SignedIn) {
      return SignIn(toggle: toggleView);
    } else {
      return Register(toggle: toggleView);
    }
  }
}

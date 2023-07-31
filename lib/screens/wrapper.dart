import 'package:flutter/material.dart';
import 'package:flutter_fcm/models/info.dart';
import 'package:flutter_fcm/screens/authenticate/authenticate.dart';
import 'package:flutter_fcm/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Info?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}

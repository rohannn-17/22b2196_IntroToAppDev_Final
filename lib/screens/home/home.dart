import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm/auth.dart';
import 'package:flutter_fcm/database.dart';
import 'package:flutter_fcm/models/gain.dart';
import 'package:flutter_fcm/screens/home/budget.dart';
import 'package:flutter_fcm/screens/home/gainlist.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: Database().gains,
      initialData: null,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 158, 148, 239),
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Color.fromARGB(255, 135, 75, 224),
          title: const Text(
            'Budget Tracker',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Center(
          child: ListView(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, size: 150, color: Colors.black),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 110,
                    )
                  ],
                ),
                const SizedBox(height: 120),
                const Text(
                  'hey ,',
                  style: TextStyle(fontFamily: 'Marker', fontSize: 27),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'welcome back!!!',
                  style: TextStyle(fontFamily: 'Marker', fontSize: 27),
                ),
                SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Username :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rohan Badgujar',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Budget()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Track Budget',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

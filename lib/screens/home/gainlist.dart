import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fcm/screens/home/gain.dart';
import 'package:provider/provider.dart';

class GainList extends StatefulWidget {
  const GainList({super.key});

  @override
  State<GainList> createState() => _GainListState();
}

class _GainListState extends State<GainList> {
  @override
  Widget build(BuildContext context) {
    final gains = Provider.of<QuerySnapshot?>(context);

    return Container();
  }
}

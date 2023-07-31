import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fcm/screens/home/gain.dart';
import 'expense.dart';

class Database {
  final String? uid;

  Database({this.uid});

  final CollectionReference collectionExpense =
      FirebaseFirestore.instance.collection('Expenses');

  Future<void> updateUser(String username, List<Expense> Expenses) async {
    return await collectionExpense
        .doc(uid)
        .set({'Username': username, 'Expenses': Expenses});
  }

  List<Gain> _gainList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Gain(
          username: doc.get('username') ?? 'new user',
          Expenses: doc.get('username') ?? []);
    }).toList();
  }

  Stream<QuerySnapshot> get gains {
    return collectionExpense.snapshots();
  }
}

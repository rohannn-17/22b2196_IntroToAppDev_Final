import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fcm/models/gain.dart';
import 'models/expense.dart';

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
      List<Expense> Exp = []
          .map((dynamic item) =>
              Expense(category: item.category, expense: item.expense))
          .toList();

      List<dynamic> expensesJson = doc.get('Expenses') ?? Exp;
      List<Expense> expenses = expensesJson
          .map((expense) => Expense.fromJson(expense))
          .cast<Expense>()
          .toList();

      return Gain(
          username: doc.get('username') ?? 'new user', Expenses: expenses);
    }).toList();
  }

  Stream<QuerySnapshot> get gains {
    return collectionExpense.snapshots();
  }
}

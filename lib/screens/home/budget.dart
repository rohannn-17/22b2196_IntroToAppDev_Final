import 'package:flutter/material.dart';
import 'package:flutter_fcm/screens/home/services.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});
  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int total = 0;
  var exp = TextEditingController();
  var cat = TextEditingController();
  List<Services> transactions = [];

  int calcuteTotal() {
    int tempTotal = 0;
    for (Services transaction in transactions) {
      int expenseAmount = int.tryParse(transaction.expense ?? '0') ?? 0;
      tempTotal += expenseAmount;
    }
    return tempTotal;
  }

  void openDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: ThemeData(
            canvasColor: Color.fromARGB(255, 43, 26, 173),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                backgroundColor: Color.fromRGBO(255, 250, 157, 1),
                title: const Text('Add expense'),
                content: Column(
                  children: [
                    TextField(
                      controller: cat,
                      decoration: const InputDecoration(
                          hintText: 'Enter Category of Expense'),
                    ),
                    TextField(
                      controller: exp,
                      decoration:
                          const InputDecoration(hintText: 'Enter Expense'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Services trans =
                              Services(expense: exp.text, category: cat.text);
                          transactions.add(trans);
                          total = calcuteTotal();
                          Navigator.of(context).pop();
                          cat.text = '';
                          exp.text = '';
                        });
                      },
                      child: const Text(
                        'Submit',
                        style:
                            TextStyle(color: Color.fromARGB(255, 52, 29, 29)),
                      )),
                ],
              ),
            ],
          ),
        ),
      );

  void deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 148, 239),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 158, 148, 239),
        title: const Text(
          'Budget Tracker',
          style: TextStyle(
              letterSpacing: 2,
              fontFamily: 'Marker',
              fontSize: 35,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 211, 237),
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.all(15),
              child: Text(
                'Total: Rs.$total',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                width: 400,
                child: Center(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      Services transaction = transactions[index];
                      return Card(
                        color: Color.fromARGB(255, 214, 211, 237),
                        elevation: 3,
                        child: ListTile(
                          // Inside the ListTile widget
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('${transaction.category}'),
                              ),
                              Text('Rs.${transaction.expense}'),
                              IconButton(
                                onPressed: () {
                                  deleteTransaction(index);
                                  setState(() {
                                    total = calcuteTotal();
                                  });
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        backgroundColor: Colors.white,
        tooltip: 'Add Expenses',
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 158, 148, 239),
          size: 35,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/newTransaction.dart';
import '../widgets/chart.dart';
import '../models/transactions.dart';
import 'theme/customTheme.dart';
import 'widgets/transactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense',
      debugShowCheckedModeBanner: false,
      // theme: CustomTheme.lightTheme,
      theme: CustomTheme.lightTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _userTransactions = [
    //   Transaction(id: 't1', title: 'books', amount: 20.4, date: DateTime.now()),
    //   Transaction(
    //       id: 't2', title: 'Grocery', amount: 30.89, date: DateTime.now()),
  ];
  bool _showChart = false;

  List<Transaction> get resentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addTransaction(String title, double amount, DateTime date) {
    Transaction addedTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(() {
      _userTransactions.add(addedTx);
    });
  }

  void startAddingNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NewTransaction(addTransaction);
      },
    );
  }

  void deleteTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
        title: Text(
          'Expense App',
          style: TextStyle(fontFamily: 'SyneMono'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddingNewTransaction(context),
          ),
        ]);
    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TransactionList(_userTransactions, deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        appBar.preferredSize.height) *
                    0.3,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Chart(resentTransactions),
              ),
            if (!isLandscape) txList,
            if (isLandscape)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Show Chart'),
                Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    })
              ]),
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.7,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Chart(resentTransactions),
                  )
                : txList
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddingNewTransaction(context),
        tooltip: 'Adding New Transaction',
        child: Icon(Icons.add),
      ),
    );
  }
}

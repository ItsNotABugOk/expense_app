// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime _selectedDate;
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  void addTx() {
    String enteredTitle = titleController.text;
    double enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
    titleController.clear();
    amountController.clear();
    _selectedDate = null;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Enter Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            // onSubmitted: (_) => addTx(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // ignore: deprecated_member_use
                child: FlatButton(
                  child: Text(
                    'Choose Date',
                  ),
                  onPressed: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now())
                      .then((value) {
                    if (value == null) {
                      return _selectedDate = DateTime.now();
                    }
                    setState(() {
                      return _selectedDate = value;
                    });
                  }),
                ),
              ),
              Text(_selectedDate.toString()),
              // ignore: deprecated_member_use
            ],
          ),

          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: addTx,
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}

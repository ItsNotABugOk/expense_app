import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function removeTx;

  TransactionList(this._userTransactions, this.removeTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      child: _userTransactions.length == 0
          ? Image.asset(
              'assets/images/bagnd.png',
              fit: BoxFit.fill,
            )
          : ListView.builder(
              itemCount: _userTransactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('\$${_userTransactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(_userTransactions[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      onPressed: () => removeTx(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

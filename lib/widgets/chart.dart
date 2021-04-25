import 'package:expence/widgets/chartBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weakDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (weakDay.year == recentTransactions[i].date.year &&
            weakDay.month == recentTransactions[i].date.month &&
            weakDay.day == recentTransactions[i].date.day) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weakDay).substring(0, 1),
        'totalSum': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending => groupedTransactionValues.fold(
      0.0, (previousValue, element) => previousValue += element['totalSum']);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: groupedTransactionValues.map((e) {
          return ChartBar(
            e['day'],
            e['totalSum'],
            maxSpending==0?0.0:
            (e['totalSum'] as double) / maxSpending,
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double totalSum;
  final double percentile;

  ChartBar(this.day, this.totalSum, this.percentile);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (_, constraints) => Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text('\$${totalSum.toStringAsFixed(0)}'),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.purple),
                        color: Color.fromRGBO(220, 220, 220, 1),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentile,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.purple),
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(day),
                ),
              )
            ]),
      ),
    );
  }
}

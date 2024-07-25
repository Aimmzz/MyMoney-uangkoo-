import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  final String title;
  final String amount;
  final Icon icon;
  const Income({Key? key, required this.title, required this.amount, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        child: icon,
        decoration: BoxDecoration(color: Colors.white),
      ),
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            'Rp. $amount',
            style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
            ),
          )
        ],
      )
    ]);
  }
}

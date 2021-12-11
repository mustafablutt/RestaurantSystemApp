import 'package:flutter/material.dart';
import 'package:restaurant_system/screens/previous_orders_screen.dart';

class PreviousOrdersTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
             TextButton(
        style: TextButton.styleFrom(
        textStyle: TextStyle(
        fontSize: 25,
          color: Color(0xFFD71219),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviousOrdersScreen(),
          ),
        );
      },
      child: const Text(
        'Previous Order',
        style: TextStyle(
            color: Color(0xFFD71219),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Image.asset('images/chat.png', height: 15),
                    SizedBox(width: 5),
                    Text('You have 5 unrecognized orders.')
                  ],
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

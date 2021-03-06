import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/screens/menu.dart';
import 'package:restaurant_system/screens/my_address_screen.dart';

class Address extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAdressScreen(),
                  ),
                );
              },
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),

              title: provider.throwaddressTitleList.isEmpty ? Text('Add Your Adrress') : Text(' ${ provider.throwaddressTitleList[0]}'),
              subtitle: provider.throwaddressList.isEmpty ? null : Text(' ${ provider.throwaddressList[0]}'),
              trailing: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: double.infinity,
            color: Colors.orange,
            child: Center(




              child: TextButton(
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
                      builder: (context) => menu(),
                    ),
                  );
                },
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

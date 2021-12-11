import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/my_provider.dart';

class MyAdressScreen extends StatefulWidget {
  static const String id = 'myAdressScreen';
  @override
  _MyAdressScreenState createState() => _MyAdressScreenState();
}

class _MyAdressScreenState extends State<MyAdressScreen> {



  String upDateadress;
  String upDateadressTittle;


  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return new Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: new AppBar(
        title: Text("MyAdress Screen"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: provider.throwaddressList.length,
        itemBuilder: (BuildContext context, int index) {
          return  provider.throwaddressList.isEmpty
              ? null
              : ListTile(
                  onLongPress: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Remove Adress'),
                        content: const Text('Do you want to remove the adress'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {});
                              provider.throwaddressList.removeAt(index);
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    provider.throwaddressTitleList[index],
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(' ${ provider.throwaddressList[index]}'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 5,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                upDateadressTittle=value;

              },
              decoration: InputDecoration(
                labelText: 'Enter your New Address Tittle',
              ).copyWith(),
            ),
              content:TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                upDateadress=value;

              },
              decoration: InputDecoration(
                labelText: 'Enter your New Address',
              ).copyWith(),
            ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {

                    });
                    Navigator.pop(context);
                    provider.throwaddressList.add(upDateadress);
                    provider.throwaddressTitleList.add(upDateadressTittle);


                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        label: const Text('Add new adress'),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }




}


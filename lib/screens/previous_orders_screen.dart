import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_system/models/my_provider.dart';
import 'package:restaurant_system/screens/resto_detail_screen.dart';
import 'package:restaurant_system/widgets/restaurant_widget.dart';

class PreviousOrdersScreen extends StatelessWidget {
  static const String id = 'profileScreen';

  final List<String> previousOrders = <String>['A', 'B', 'C'];
  int foodNumberInOrder = 2;
  final List<int> orderPrices = <int>[12, 23, 43];

  @override
  Widget build(BuildContext context) {
    List myPrevorderList = [];
    MyProvider provider = Provider.of<MyProvider>(context);
    myPrevorderList = provider.throwPrevOrderList;
    provider.getprevList();


    for (int i = 0; i < myPrevorderList.length; i++) {
      // print("bu $i" + myPrevorderList[i]);
    }


    return new Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: new AppBar(
        title: Text("Previous Orders"),
      ),
      body: myPrevorderList.isEmpty ? Center(child: Text('You Dont have Previous Order ')) : ListView.separated(
        padding: const EdgeInsets.all(8),
        // itemCount: myPrevorderList[0]['list$index'].length,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                height: 25,
                width: 40,
                child: Center(
                  child: Text(
                    '9.2',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("CemMustafa's Restaurant"),
                    subtitle: Text('Order Date: 21.06.2021'),
                    onTap: () {
                      //   Navigator.push(
                      //context,
                      // MaterialPageRoute(
                      // builder: (context) => RestoDetailScreen(
                      //       // restaurantName: e.name,
                      //       // restaurantAdress: e.adres,
                      //       // restaurantPoint: e.point,
                      //       // restaurantImage: e.restaurantImage,
                      //       ),
                      // ),
                      //);
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: myPrevorderList[0]['list$index'].length,
                    // itemCount: 2,
                    itemBuilder: (BuildContext context, int index2) {
                      return ListTile(
                        title: Text(
                          // 'dsadsasd',
                          myPrevorderList[0]['list0'][index2]['name'],
                        ),
                        trailing: Text(
                          '1 adet',
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Text(
                      'Total Price',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '${orderPrices[index]} TL',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
              isThreeLine: true,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 5,
        ),
      ),
    );
  }
} //

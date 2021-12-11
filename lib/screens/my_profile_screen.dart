import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_system/animations/fade_animation.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _myfirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String name;
  String newName;
  String newSurname;
  // String newMail;



  Future<String> getName() async {
    DocumentReference documentReference =
    _myfirestore.collection('users').doc(_auth.currentUser.uid);

    await documentReference.get().then((DocumentSnapshot docSnapshot) {
      setState(() {
        name = docSnapshot.data()['name'].toString();
      });
    });
    // print("1" + name);
    return name;
  }

  @override
  Widget build(BuildContext context) {
    getName();
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/person.png'), //TODO kullanıcı resmi
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                    '$name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                FadeAnimation(
                                    1.2,
                                    Text(
                                      "9.5 UserPoint",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                    1.3,
                                    Text(
                                      "Prime User",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1.6,
                          Column(
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                tileColor: Colors.white,
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    newName=value;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                  ).copyWith(),
                                ),
                              ),
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                tileColor: Colors.white,
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    newSurname=value;

                               },
                                  decoration: InputDecoration(
                                    labelText: 'Surname',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ).copyWith(),
                                ),
                              ),
                              // ListTile(
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(100.0),
                              //   ),
                              //   tileColor: Colors.white,
                              //   title: TextFormField(
                              //     keyboardType: TextInputType.emailAddress,
                              //     textAlign: TextAlign.center,
                              //     onChanged: (value) {
                              //       newMail=value;
                              //     },
                              //     decoration: InputDecoration(
                              //       labelText: 'Email',
                              //       floatingLabelBehavior:
                              //           FloatingLabelBehavior.always,
                              //     ).copyWith(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Born",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "April, 15th 1990, Paris, France",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeAnimation(
                  2,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green),
                    child: Align(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 25,
                            color: Color(0xFFD71219),
                          ),
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Update Profile'),
                              content: const Text('Do you to change your Profile Information?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _myfirestore
                                        .collection('users')
                                        .doc(_auth.currentUser.uid)
                                        .update({
                                      // 'email': newMail,
                                      // 'password': user1.password,
                                      'name': newName,
                                      'surname': newSurname,
                                    });


                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          );

                        },
                        child: const Text(
                          'Update Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.3)
          ])),
          child: Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}

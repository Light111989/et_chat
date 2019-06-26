import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String image = "";
  @override
  void initState() {
    super.initState();
    _getCurrentUserInfo();
  }

  void _getCurrentUserInfo() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userInfo =
        await Firestore.instance.collection("Users").document(user.uid).get();
    setState(() {
      image = userInfo.data["img"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.only(top: 200),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                  Image.network(image),
                ],
              ))),
    );
  }
}

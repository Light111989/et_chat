import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'avatarProfile.dart';

class AvatarModal {
  showImageSelection(BuildContext context, DocumentSnapshot userInfo) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('View Profile Picture'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AvatarProfile(userInfo.data['img'])));
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Select Profile Picture'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

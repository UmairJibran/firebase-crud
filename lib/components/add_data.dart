import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void addData(context) async {
  bool userExists;
  var doc = await Firestore.instance
      .collection('usersName')
      .document('dummydata')
      .get();
  userExists = doc.exists;
  String userName = '';
  var _key = GlobalKey<FormState>();
  showModalBottomSheet(
    context: context,
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: userExists
          ? Center(
              child: Text(
                'User Already exist Please Delete Current User to add your User',
                textAlign: TextAlign.center,
              ),
            )
          : Form(
              key: _key,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Please Enter Your Name",
                      contentPadding: EdgeInsets.all(5),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please Enter a name';
                      } else if (value.trim().length < 3) {
                        return 'Please Enter a valid name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      userName = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () async {
                        if (_key.currentState.validate()) {
                          _key.currentState.save();
                          await Firestore.instance
                              .collection('usersName')
                              .document('dummydata')
                              .setData(
                            {
                              'name': '$userName',
                            },
                          ).timeout(
                            Duration(
                              seconds: 10,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
    ),
  );
}

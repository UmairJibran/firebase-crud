import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void updateData(context) async {
  String newUserName = '';
  var _key = GlobalKey<FormState>();
  bool userExists;
  var doc = await Firestore.instance
      .collection('usersName')
      .document('dummydata')
      .get();
  userExists = doc.exists;
  showModalBottomSheet(
    context: context,
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _key,
        autovalidate: true,
        child: userExists
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Please Enter Your New Name",
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
                      newUserName = value;
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
                              .updateData(
                            {'name': '$newUserName'},
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text('User Does not exist'),
              ),
      ),
    ),
  );
}

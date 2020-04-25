import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

double height;
double width;

void readData(context, {height, width}) async {
  String name;
  DocumentSnapshot _doc = await Firestore.instance
      .collection('usersName')
      .document('dummydata')
      .get()
      .timeout(Duration(seconds: 10));
  (_doc.exists) ? name = _doc['name'] : name = null;
  showDialog(
    context: context,
    builder: (_) => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: height * 0.3,
        width: width * 0.8,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (name == null)
                  ? Text('There is No user in the database')
                  : Text(
                      "Hi $name, have a great day. And I hope you don't face any problems learning firebase",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

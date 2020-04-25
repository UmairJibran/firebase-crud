import 'package:flutter/material.dart';

double height;
double width;

void removeData(context, {height, width}) {
  showDialog(
    context: context,
    builder: (_) => Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: height * 0.3,
        width: width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Are you sure you want to delete data from the database?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        //TODO add Firebase Functionality to delete data from the firebase
                      },
                      child: Text('Yes'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.redAccent[100],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

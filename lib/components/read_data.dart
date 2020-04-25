import 'package:flutter/material.dart';

double height;
double width;

void readData(context, {height, width}) {
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
              Text(
                "Hi [Name], have a great day. And I hope you don't face any problems learning firebase",
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

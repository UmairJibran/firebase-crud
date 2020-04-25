import 'package:flutter/material.dart';
import '../components/add_data.dart';
import '../components/read_data.dart';
import '../components/remove_data.dart';
import '../components/update_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD'),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height * 0.07,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                onPressed: () => addData(context),
                child: Text(
                  'Add Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                onPressed: () => readData(
                  context,
                  height: height,
                  width: width,
                ),
                child: Text(
                  'Read Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                onPressed: () => updateData(context),
                child: Text(
                  'Update Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                onPressed: () => removeData(
                  context,
                  height: height,
                  width: width,
                ),
                child: Text(
                  'Remove Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

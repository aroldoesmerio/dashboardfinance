import 'package:flutter/material.dart';

Card MakeDashBoardItem(String title, String subTitle, String value) {
  return Card(
    elevation: 1.0,
    margin: EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                subTitle,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                value,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

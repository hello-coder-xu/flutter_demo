import 'package:flutter/material.dart';


Widget sizedBox=SizedBox(width: 16,height: 16);


Widget titleBarWidget({title}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Text(title),
  );
}


Widget buttonWidget({title, onPressed}) {
  return Container(
    width: 300,
    height: 40,
    color: Colors.green,
    child: FlatButton(
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
      onPressed: onPressed,
    ),
  );
}

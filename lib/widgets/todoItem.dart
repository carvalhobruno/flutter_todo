import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class TodoItem extends StatelessWidget {
  TodoItem({this.title, this.description});
  final String title;
  final String description;
  final Color randomColor = RandomColor().randomColor(colorHue: ColorHue.blue);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        contentPadding: new EdgeInsets.all(12.0),
        title: Text(this.title,  style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(this.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Icon(Icons.keyboard_arrow_right),
        leading: new CircleAvatar(
          child: new Text(this.title.substring(0,1)),
          backgroundColor: randomColor
          ,
        )
    );
  }
}
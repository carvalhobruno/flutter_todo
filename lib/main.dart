import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/widgets/todoItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'To-do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<TodoItem> todoItems = <TodoItem>[];

  pushTodoItem(String title, String description) {
    setState(() {
      TodoItem message = new TodoItem(
        title: title,
        description: description,
      );
      setState(() {
        todoItems.insert(0, message);
      });
    });
  }

  void _addItem() {
    var description = generateWordPairs().take(20).join(" ");
    pushTodoItem(WordPair.random().asString, description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        new Column(
          children: [
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemBuilder: (_, int index) => todoItems[index],
                itemCount: todoItems.length,
              ),
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed:  _addItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}




//class ListScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Open route'),
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ItemScreen()),
//              );
//            }
//        ),
//      ),
//    );
//  }
//}
//
//class ItemScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}
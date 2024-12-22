import 'package:flutter/material.dart';
import 'package:flutter_toast/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fToast = FToast();

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "This is Long Toast",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
    );
  }

  void showShortToast() {
    Fluttertoast.showToast(
      msg: "This is Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
    );
  }

  void showCenterToast() {
    Fluttertoast.showToast(
      msg: "This is Center Toast",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.CENTER,
    );
  }

  void showCustomToast() {
    final customViewToast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.notifications),
              const Text(
                "This is Custom Toast",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Text(
            'This is Custom Toast with Custom View',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: customViewToast,
      gravity: ToastGravity.CENTER,
    );
  }

  void showGlobalToast() {
    globalToast.showToast(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.blue,
        ),
        padding: EdgeInsets.all(20),
        child: Text(
          'This is Global Toast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      gravity: ToastGravity.CENTER,
    );
  }

  void cancelToast() {
    Fluttertoast.cancel();
  }

  void cancelCustomToast() {
    fToast.removeCustomToast();
  }

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notif Toast'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Long'),
            onTap: showLongToast,
          ),
          ListTile(
            title: const Text('Sort'),
            onTap: showShortToast,
          ),
          ListTile(
            title: const Text('Center'),
            onTap: showCenterToast,
          ),
          ListTile(
            title: const Text('Custom'),
            onTap: showCustomToast,
          ),
          ListTile(
            title: const Text('Global'),
            onTap: showGlobalToast,
          ),
          Divider(),
          ListTile(
            title: const Text('Cancel Toast'),
            onTap: cancelToast,
          ),
          ListTile(
            title: const Text('Cancel Custom Toast'),
            onTap: cancelCustomToast,
          ),
        ],
      ),
    );
  }
}

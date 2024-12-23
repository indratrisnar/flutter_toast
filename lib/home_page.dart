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
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void showShortToast() {
    Fluttertoast.showToast(
      msg: "This is Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void showCenterToast() {
    Fluttertoast.showToast(
      msg: "This is Center Toast",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      gravity: ToastGravity.CENTER,
    );
  }

  void showCustomToast() {
    fToast.showToast(
      child: Container(
        color: Colors.blue.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check),
                Text(
                  'This is Custom Toast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            Text(
              'This is Custom Toast descriptiona saiisjas',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      toastDuration: const Duration(seconds: 2),
    );
  }

  void showGlobalToast() {
    globalToast.showToast(
      child: Container(
        color: Colors.green,
        padding: EdgeInsets.all(30),
        child: Text(
          'This is Global Toast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      toastDuration: const Duration(seconds: 2),
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

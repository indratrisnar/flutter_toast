import 'package:flutter/material.dart';
import 'package:flutter_toast/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final globalToast = FToast();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        globalToast.init(context);
        return child!;
      },
      home: HomePage(),
      navigatorKey: navigatorKey,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/page/home_page.dart';
import 'package:todoapp/provider/todos_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = "What TODO";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const HomePage(),
        ),
      );
}

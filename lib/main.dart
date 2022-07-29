import 'package:flutter/material.dart';
import 'package:spotify/ui/themes/default.dart';

import 'ui/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme.theme,
      home: const HomePage(),
    );
  }
}

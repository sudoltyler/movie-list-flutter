
import 'package:flutter/material.dart';
import 'package:project_2/Widgets/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'Resources/GlobalHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return a provider widget so same info can be accessed in other dart files
    return Provider(
        create: (_) => GlobalHelper(),
        child: MaterialApp(
          title: 'Movie Lists',
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
          home: MovieListHome(),
        ));
  }
}

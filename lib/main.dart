import 'package:flutter/material.dart';
import './details/cat_list.dart';
import 'cat.dart';
import 'details/fetchCats.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List cats = await loadCats();
  runApp(MyApp(cats: cats as List<Cat>));
}

class MyApp extends StatelessWidget {
  // Dummy list of cats for demonstration
  final List<Cat> cats;
  MyApp({required this.cats});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatListPage(cats: cats),
    );
  }
}

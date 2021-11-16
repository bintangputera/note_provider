import 'package:flutter/material.dart';
import 'package:note_provider/modules/add/screens/add_screen.dart';
import 'package:note_provider/modules/detail/screen/detail_screen.dart';
import 'package:note_provider/modules/home/model/note.dart';
import 'package:provider/provider.dart';

import 'modules/home/provider/note_provider.dart';
import 'modules/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "FreeSans",
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName : (context) => HomeScreen(),
          AddScreen.routeName : (context) => AddScreen(),
          DetailScreen.routeName : (context) => DetailScreen(
            ModalRoute.of(context)!.settings.arguments as Note
          )
        },
      ),
    );
  }
}
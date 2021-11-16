import 'package:flutter/material.dart';
import 'package:note_provider/modules/add/screens/add_screen.dart';
import 'package:note_provider/modules/home/provider/note_provider.dart';
import 'package:note_provider/widgets/common/note_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/homeScreen";

  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddScreen.routeName);
        },
      ),
      appBar: AppBar(
        title: Text(
          "Task Manager",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Consumer<NoteProvider>(
        builder: (context, data, child) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.getNotes.length,
            itemBuilder: (BuildContext context, int index) {
              return NoteCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

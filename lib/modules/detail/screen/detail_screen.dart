import 'package:flutter/material.dart';
import 'package:note_provider/modules/home/model/note.dart';
import 'package:note_provider/modules/home/provider/note_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.note);

  static const routeName = "/detailScreen";

  final Note note;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add new task",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              child: Icon(Icons.check),
              onTap: () {
                Provider.of<NoteProvider>(context, listen: false)
                    .deleteNote(widget.note.id);
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Text(widget.note.id.toString()),
      ),
    );
  }
}

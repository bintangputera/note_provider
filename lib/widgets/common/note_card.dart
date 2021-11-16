
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:note_provider/modules/detail/screen/detail_screen.dart';
import 'package:note_provider/modules/home/model/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 2,
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.routeName, arguments: note);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.all(16),
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                Text(note.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

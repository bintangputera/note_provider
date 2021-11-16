import 'package:flutter/cupertino.dart';
import 'package:note_provider/modules/home/model/note.dart';

class NoteProvider extends ChangeNotifier {
  
  // list of note
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NoteProvider() {
    addNewNote('First note', 'First note description');
  }

  void addNewNote(String title, String description) {
    Note note = Note(id: _notes.length, title: title, description: description);
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int id) {
    _notes.removeAt(id);
    notifyListeners();
  }

}
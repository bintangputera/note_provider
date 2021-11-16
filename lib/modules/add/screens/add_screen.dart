import 'package:flutter/material.dart';
import 'package:note_provider/modules/home/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  static const routeName = "/addScreen";

  late String taskTitle;
  late String taskDescription;

  bool _titleIsNull = true;
  bool _descisNull = true;

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: widget._titleIsNull && widget._descisNull
                ? Container()
                : GestureDetector(
                    child: Icon(Icons.check),
                    onTap: () {
                      Provider.of<NoteProvider>(context, listen: false).addNewNote(widget.taskTitle, widget.taskDescription);
                      Navigator.pop(context);
                    },
                  ),
          ),
        ],
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Text("title : ${widget._titleIsNull}"),
          // Text("desc :  ${widget._descisNull}"),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Task title",
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            onChanged: (value) {
              widget.taskTitle = value;
              setState(
                () {
                  if (value.isEmpty) {
                    widget._titleIsNull = true;
                  } else {
                    widget._titleIsNull = false;
                  }
                },
              );
            },
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Task title",
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            onChanged: (value) {
              widget.taskDescription = value;
              setState(
                () {
                  if (value.isEmpty) {
                    widget._descisNull = true;
                  } else {
                    widget._descisNull = false;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

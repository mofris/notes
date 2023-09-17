import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_item.dart';

class NotesGrid extends StatefulWidget {
  final List<Note> listNote;
  final Function(String id) toggleIsPin;

  NotesGrid(this.listNote, this.toggleIsPin);

  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    List<Note> tempListNote =
        widget.listNote.where((note) => note.isPinned).toList();
    tempListNote
        .addAll(widget.listNote.where((data) => !data.isPinned).toList());
    return Padding(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: tempListNote.length,
        itemBuilder: (ctx, index) => NoteItem(
          id: tempListNote[index].id ?? '',
          note: tempListNote[index].note,
          title: tempListNote[index].title,
          isPin: tempListNote[index].isPinned,
          isPinnedFn: widget.toggleIsPin,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          // childAspectRatio: 1.3,
        ),
      ),
    );
  }
}

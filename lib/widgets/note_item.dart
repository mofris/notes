import 'package:flutter/material.dart';
import 'package:notes/presentations/costum_icons_icons.dart';

class NoteItem extends StatefulWidget {
  final String id;
  final String note;
  final String title;
  final bool isPin;
  final Function(String id) isPinnedFn;

  NoteItem({
    required this.id,
    required this.note,
    required this.title,
    required this.isPin,
    required this.isPinnedFn,
  });

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late bool _isPinned;

  @override
  Widget build(BuildContext context) {
    _isPinned = widget.isPin;
    return GridTile(
      header: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              widget.isPinnedFn(widget.id);
            },
            icon: Icon(_isPinned ? CostumIcons.pin : CostumIcons.pin_outline),
          )),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[800]),
        child: Text(widget.note),
        padding: EdgeInsets.all(12),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(widget.title),
        ),
      ),
    );
  }
}

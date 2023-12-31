import 'package:flutter/cupertino.dart';

class Note {
  final String? id;
  final String title;
  final String note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool isPinned;

  Note({
    required this.id,
    required this.title,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
  });

  Note copyWith({
    String? id,
    String? title,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPinned,
  }) {
    return Note(
      id: id == null ? this.id : id,
      title: title == null ? this.title : title,
      note: note == null ? this.note : note,
      createdAt: createdAt == null ? this.createdAt : createdAt,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt,
      isPinned: isPinned == null ? this.isPinned : isPinned,
    );
  }
}

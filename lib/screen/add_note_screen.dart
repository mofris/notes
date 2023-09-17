import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NoteAddScreen extends StatefulWidget {
  final Function(Note data) addNote;

  NoteAddScreen(this.addNote);

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  Note _note =
      Note(id: null, title: '', note: '', createdAt: null, updatedAt: null);

  final _formKey = GlobalKey<FormState>();

  void submitNote() {
    WidgetsFlutterBinding
        .ensureInitialized(); // Pastikan binding Flutter diinisialisasi
    tz.initializeTimeZones(); // Inisialisasi database zona waktu

    _formKey?.currentState?.save();
    // print('title : ' + _note.title);

    // Dapatkan zona waktu Jakarta
    final jakarta = tz.getLocation('Asia/Jakarta');

    // Buat objek DateTime dengan zona waktu Jakarta
    final now = tz.TZDateTime.now(jakarta);

    _note = _note.copyWith(updatedAt: now, createdAt: now);

    // adddata
    widget.addNote(_note);

    // kembali kehalaman sebelumnya
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: submitNote, child: Text("Simpan"))],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        hintText: "Judul", border: InputBorder.none),
                    onSaved: (value) {
                      _note = _note.copyWith(title: value);
                    }),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Catatan", border: InputBorder.none),
                  onSaved: (value) {
                    _note = _note.copyWith(note: value);
                  },
                )
              ],
            )),
      ),
    );
  }
}

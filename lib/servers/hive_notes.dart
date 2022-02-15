import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:jasco/models/notes_model.dart';

class HiveDB {
  static var box = Hive.box("jasco");

  static setNote(List<Notes> notes) {
    box.put("note", Notes.encode(notes));
  }

  static List<Notes> getNote(List<Notes> list) {
    list = Notes.decode(box.get("note"))??[];
    return list;
  }
}

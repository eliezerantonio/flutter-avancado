import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Student extends ChangeNotifier {
  String name;
  String genre;
  num note;
  String course;

  Student.fromDocument(DocumentSnapshot doc)
      : name = doc.data["name"],
        genre = doc.data["genre"],
        note = doc.data["note"],
        course = doc.data["course"];

  bool _loading = false;

  set loading(bool value) {
    _loading = false;

    notifyListeners();
  }

  get loading => _loading;

  void save(Student student) async {
    try {
      loading = true;

      final firestore = await Firestore.instance.document("student").setData({
        "name": student.name,
        "genre": student.genre,
        "course": student.course,
        "note": student.note,
      });

      loading = false;
    } catch (e) {}
  }
}

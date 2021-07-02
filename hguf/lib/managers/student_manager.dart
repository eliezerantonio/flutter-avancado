import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionic/model/student.dart';

class StudentManager extends ChangeNotifier {
  List<Student> students = [];

  Student student;
  final Firestore firestore = Firestore.instance;

  Future<void> _loadStoreListUser() async {
    final snapshot = await firestore.collection('student').getDocuments();
    students.clear();
    students = snapshot.documents.map((e) => Student.fromDocument(e)).toList();

    notifyListeners();
  }
}

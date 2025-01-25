import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class TasksService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getTodoStream() {
    return _firestore.collection("todo").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final todos = doc.data();
        todos['id'] = doc.id;
        return todos;
      }).toList();
    });
  }

  Future<void> addTodo(
    Map<String, dynamic> payload,
  ) async {
    String uid = "xWkhH2sNEVPiCDbAr4tN";
    try {
      DocumentReference userDoc = _firestore.collection("todo").doc(uid);

      await userDoc.update({
        "todos": FieldValue.arrayUnion([payload]),
      });

      log("Todo added successfully to Firestore");
    } catch (e) {
      log(e.toString(), name: "Todo Service Add Todo");
    }
  }



}

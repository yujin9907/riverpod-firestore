// 웹 통신을 위한 리포지토리
// provider 추후 세팅

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revierpod_firestore_stream/domain/chat/chat.dart';
import 'package:revierpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatFirestoreRepository = Provider((ref) {
  return ChatFirestoreRepository();
});

class ChatFirestoreRepository {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> insert(ChatInsertReqDto dto) {
    return db.collection("chat").add(dto.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> findAllStream() {
    return db.collection("chat").snapshots();
  }
}

// 리턴 : stream List chat
final chatStreamProvider = StreamProvider<List<Chat>>((ref) {
  return FirebaseFirestore.instance.collection("chat").snapshots().map(
      (event) => event.docs
          .map((doc) => Chat(
              doc.id, doc.data()["from"], doc.data()["to"], doc.data()["msg"]))
          .toList());
});

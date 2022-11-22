import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revierpod_firestore_stream/core/routes_enum.dart';
import 'package:revierpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:revierpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatController = Provider((ref) {
  return ChatController(ref);
});

class ChatController {
  // ref 의존
  Ref _ref;
  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) async {
    // future 타입으로 받기 싫으면 기다렸다가 받음(await로 )
    DocumentReference d = await _ref.read(chatFirestoreRepository).insert(dto);
    // d.snapshots(); // object 타입

    print("디버그 : ${d.snapshots()}");
    print("디버그 : ${d.id}");

    Future<DocumentReference> futured =
        _ref.read(chatFirestoreRepository).insert(dto);
    futured.then((value) {
      // 화면 제어 Navigator
      // .pushNamed, .pushNamedAndRemoveUntil
      // Navigator.popAndPushNamed(context, Routes.login.path);
      // Navigator.pop(context); // 현재화면 스택에서 제거
    }).onError((error, stackTrace) {
      print("error");
      // alart 띄우면 됨
    });
  }

  void findAllStream() {}
}

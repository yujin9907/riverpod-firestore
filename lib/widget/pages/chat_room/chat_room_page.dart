import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revierpod_firestore_stream/controller/chat_controller.dart';
import 'package:revierpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:revierpod_firestore_stream/dto/chat/chat_req_dto.dart';

class ChatRoomPage extends ConsumerWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatControllerDI = ref.read(chatController);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = Random();
          ChatInsertReqDto dto =
              ChatInsertReqDto("ssar", "cos", "hello-${random.nextInt(100)}");
          chatControllerDI.insert(dto);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(WidgetRef ref) {
    final chatStream = ref.watch(chatStreamProvider); // 스트림<리스트(쳇타입)> 리턴
    return chatStream.when(
      // 에러 방지 when
      data: (chats) {
        if (chats.isNotEmpty) {
          return ListView.separated(
            itemCount: chats.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("msg : ${chats[index].msg}"),
              subtitle: Text("from : ${chats[index].from}"),
            ),
            separatorBuilder: (context, index) => Divider(),
          );
        } else {
          return Center(
            child: Text("채팅 내역 없음"),
          );
        }
      },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => CircularProgressIndicator(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("riverpod & firestore & stream"),
    );
  }
}

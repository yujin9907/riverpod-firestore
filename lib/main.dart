import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revierpod_firestore_stream/firebase_options.dart';
import 'package:revierpod_firestore_stream/widget/pages/chat_room/chat_room_page.dart';

// 위젯에서 프로바이더를 일고 사용하기 위해 프로바이더 위젯으로 감쌈
// 여기서 프로바이더가 저장되는 곳입니다.

void main() async {
  // firebase 초기화 await -> 통신-응답 이기 때문에 비동기 설정(async)
  WidgetsFlutterBinding.ensureInitialized(); // 메인 메서드에 비동기 작업이 있으면 필요
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatRoomPage(),
    );
  }
}

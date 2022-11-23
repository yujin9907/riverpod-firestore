import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoLogin extends StatefulWidget {
  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();

    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FloatingActionButton(
                  onPressed: () {
                    _loginButtonPressed();
                  },
                  child: Text('카카오 로그인',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}

enum Routes {
  login("/login"),
  join("/join"),
  home("/home");

  final String path;

  const Routes(this.path); // Routes.login.path 로 호출
}

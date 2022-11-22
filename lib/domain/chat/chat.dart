class Chat {
  String id;
  String from;
  String to;
  String msg;

  Chat(this.id, this.from, this.to, this.msg);

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        json["id"],
        json["from"],
        json["to"],
        json["msg"],
      );
}

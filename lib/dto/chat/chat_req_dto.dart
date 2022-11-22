class ChatInsertReqDto {
  String from;
  String to;
  String msg;

  ChatInsertReqDto(this.from, this.to, this.msg);

  // dart -> map (toJson)
  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "msg": msg,
      };

  // map -> dart(fromJson)
  factory ChatInsertReqDto.fromJson(Map<String, dynamic> json) =>
      ChatInsertReqDto(
        json["from"],
        json["to"],
        json["msg"],
      );
}

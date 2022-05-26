class MsgModel {
  dynamic data;
  String id;
  MsgModel({required this.data, required this.id});

  factory MsgModel.fromJson(Map<String, dynamic> json) {
    return MsgModel(
      id: json['id'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data,
    };
  }
}

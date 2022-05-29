import 'package:project_111/features/conversation/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel(
      {required String senderFullname,
      required String receiverFullname,
      required String dateSent,
      required String message})
      : super(
            senderFullname: senderFullname,
            receiverFullname: receiverFullname,
            dateSent: dateSent,
            message: message);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        senderFullname: json['senderFullname'],
        receiverFullname: json['receiverFullname'],
        dateSent: json['dateSent'],
        message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_fullname'] = senderFullname;
    data['receiver_fullname'] = receiverFullname;
    data['dateSent'] = dateSent;
    data['message'] = message;
    return data;
  }
}

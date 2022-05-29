
import 'package:equatable/equatable.dart';

class Message extends Equatable{
  final String senderFullname;
  final String receiverFullname;
  final String dateSent;
  final String message;

  Message(
      {required this.senderFullname,
        required this.receiverFullname,
        required this.dateSent,
        required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [senderFullname,receiverFullname,dateSent,message];
}
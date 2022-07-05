import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/messages_repositories.dart';

import '../entities/message.dart';

class SendMessage{
  final MessagesRepositories messagesRepositories;

  SendMessage(this.messagesRepositories);
  Future<Either<Failure,Unit>> call(Message message)async{
return await messagesRepositories.sendMessages(message);
  }
}
import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/conversation/domain/repositories/messages_repositories.dart';

import '../entities/message.dart';

class SendMessage{
  final MessagesRepositories messagesRepositories;

  SendMessage(this.messagesRepositories);
  Future<Either<Failure,Unit>> call(Message message)async{
return await messagesRepositories.sendMessages(message);
  }
}
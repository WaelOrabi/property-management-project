import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/conversation/domain/entities/message.dart';

import '../repositories/messages_repositories.dart';

class GetMessages{
final MessagesRepositories messagesRepositories;

  GetMessages(this.messagesRepositories);
  Future<Either<Failure,List<Message>>> call() async{
   return await messagesRepositories.getMessages();
  }

}
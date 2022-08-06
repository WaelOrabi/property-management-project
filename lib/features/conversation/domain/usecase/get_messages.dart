import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/message.dart';

import '../repositories/messages_repositories.dart';

class GetMessages{
final MessagesRepositories messagesRepositories;

  GetMessages(this.messagesRepositories);
  Future<Either<Failure,List<Message>>> call() async{
   return await messagesRepositories.getMessages();
  }

}
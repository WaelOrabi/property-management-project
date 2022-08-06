import 'package:dartz/dartz.dart';
import '../repositories/messages_repositories.dart';

import '../../../../core/error/failures.dart';
import '../entities/message.dart';

class UpdateMessage{
  final MessagesRepositories messagesRepositories;

  UpdateMessage(this.messagesRepositories);
  Future<Either<Failure,Unit>> call(Message message)async{
    return await messagesRepositories.updateMessages(message);
  }

}
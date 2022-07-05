import 'package:dartz/dartz.dart';
import '../repositories/messages_repositories.dart';

import '../../../../core/error/failures.dart';

class DeleteMessage{
  final MessagesRepositories messagesRepositories;

  DeleteMessage(this.messagesRepositories);
  Future<Either<Failure,Unit>> call(int messageId) async{
    return await messagesRepositories.deleteMessages(messageId);
}

}
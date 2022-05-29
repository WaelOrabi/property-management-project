import 'package:dartz/dartz.dart';
import 'package:project_111/features/conversation/domain/repositories/messages_repositories.dart';

import '../../../../core/error/failures.dart';

class DeleteMessage{
  final MessagesRepositories messagesRepositories;

  DeleteMessage(this.messagesRepositories);
  Future<Either<Failure,Unit>> call(int messageId) async{
    return await messagesRepositories.deleteMessages(messageId);
}

}
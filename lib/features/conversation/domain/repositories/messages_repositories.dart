import 'package:dartz/dartz.dart';
import '../entities/message.dart';

import '../../../../core/error/failures.dart';

abstract class MessagesRepositories{
Future<Either<Failure, List<Message>>>getMessages();
Future<Either<Failure,Unit>> deleteMessages(int messageId);
Future<Either<Failure,Unit>> sendMessages(Message message);
Future<Either<Failure,Unit >> updateMessages(Message message);

}
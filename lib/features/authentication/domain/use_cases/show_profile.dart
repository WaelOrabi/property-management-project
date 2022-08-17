import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

class ShowProfileUseCases {
  final UserRepositories repositories;
  ShowProfileUseCases(this.repositories);
  Future<Either<Failure, User>> call(int userId) async {
    return await repositories.showProfile(userId);
  }
}

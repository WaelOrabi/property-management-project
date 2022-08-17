import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';


class ChangePasswordUseCases {
  final UserRepositories repositories;
  ChangePasswordUseCases(this.repositories);
  Future<Either<Failure, Unit>> call(int userId) async {
    return await repositories.changePassword(userId);
  }
}
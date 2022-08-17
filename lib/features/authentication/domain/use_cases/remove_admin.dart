import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';


class RemoveAdminUseCases {
  final UserRepositories repositories;
  RemoveAdminUseCases(this.repositories);
  Future<Either<Failure, Unit>> call(int userId) async {
    return await repositories.removeAdmin(userId);
  }
}
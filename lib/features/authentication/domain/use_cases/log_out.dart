import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';


class LogOutUseCases {
  final UserRepositories repositories;
  LogOutUseCases(this.repositories);
  Future<Either<Failure, Unit>> call() async {
    return await repositories.logOut();
  }
}
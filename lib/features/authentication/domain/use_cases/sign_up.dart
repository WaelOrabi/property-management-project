import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/entities/user.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';


class SignUpUseCases {
  final UserRepositories repositories;
  SignUpUseCases(this.repositories);
  Future<Either<Failure, Unit>> call(User user) async {
    return await repositories.signUp(user);
  }
}
import 'package:dartz/dartz.dart';
import 'package:project_111/features/authentication/domain/entities/user.dart';
import 'package:project_111/features/authentication/domain/repositories/user_repositories.dart';

import '../../../../core/error/failures.dart';


class SearchUserUseCases {
  final UserRepositories repositories;
  SearchUserUseCases(this.repositories);
  Future<Either<Failure, List<User>>> call(User user) async {
    return await repositories.searchUser(user);
  }
}
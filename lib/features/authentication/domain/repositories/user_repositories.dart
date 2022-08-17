import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/authentication/domain/entities/user.dart';

abstract class UserRepositories {
  Future<Either<Failure, User>> showProfile(int userId);
  Future<Either<Failure, Unit>> updateProfile(int userId);
  Future<Either<Failure, Unit>> changePassword(int userId);
  Future<Either<Failure, Unit>> blockUser(int userId);
  Future<Either<Failure, List<User>>> searchUser(User user);
  Future<Either<Failure, Unit>> setAdmin(int userId);
  Future<Either<Failure, Unit>> removeAdmin(int userId);
  Future<Either<Failure, Unit>> signIn(User user);
  Future<Either<Failure, Unit>> signUp(User user);
  Future<Either<Failure, Unit>> logOut();
}

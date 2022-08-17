import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

class DeleteFavoriteUseCases {
  final PropertiesRepositories repositories;
  DeleteFavoriteUseCases(this.repositories);

  Future<Either<Failure, Unit>> call(int propertyId) async {
    return await repositories.deleteFavorite(propertyId);
  }
}

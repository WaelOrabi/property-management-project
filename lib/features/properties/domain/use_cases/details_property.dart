import 'package:dartz/dartz.dart';
import 'package:project_111/core/error/failures.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

class DetailsPropertyUseCases {
  final PropertiesRepositories repositories;
  DetailsPropertyUseCases(this.repositories);
  Future<Either<Failure, Property>> call(int propertyId) async {
    return await repositories.detailsProperty(propertyId);
  }
}

import 'package:dartz/dartz.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

import '../../../../core/error/failures.dart';

class AddPropertyUseCases {
  PropertiesRepositories repositories;
  AddPropertyUseCases(this.repositories);
  Future<Either<Failure, Unit>> call(Property property) async {
    return await repositories.addProperty(property);
  }
}

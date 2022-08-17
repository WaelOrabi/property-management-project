import 'package:dartz/dartz.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

import '../../../../core/error/failures.dart';
import '../entities/property.dart';

class UpdatePropertyUseCases {
  final PropertiesRepositories repositories;
  UpdatePropertyUseCases(this.repositories);
  Future<Either<Failure, Unit>> call(Property property) async {
    return await repositories.updatProperty(property);
  }
}

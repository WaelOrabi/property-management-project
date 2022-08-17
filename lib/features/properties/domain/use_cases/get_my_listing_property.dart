import 'package:dartz/dartz.dart';
import 'package:project_111/features/properties/domain/repositories/properties_repositories.dart';

import '../../../../core/error/failures.dart';
import '../entities/property.dart';

class GetMyListingPropertyUseCases {
  final PropertiesRepositories repositories;
  GetMyListingPropertyUseCases(this.repositories);
    Future<Either<Failure, List<Property>>> call() async {
    return await repositories.getMyListingProperties();
  }
}

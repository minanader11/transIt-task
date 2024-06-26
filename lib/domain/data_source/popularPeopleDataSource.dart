import 'package:dartz/dartz.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

abstract class PopularPeopleRemoteDataSource {
  Future<Either<Failures,PopularPeopleResponseEntity>> getPopularPeople(String pageNumber);
}
abstract class PopularPeopleLocalDataSource{
  Future<Either<Failures,PopularPeopleResponseEntity>> getPopularPeople();
  void savePopularPeople(PopularPeopleResponseEntity popularPeopleResponseEntity);
}
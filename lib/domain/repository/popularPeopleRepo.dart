import 'package:dartz/dartz.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

abstract class PopularPeopleRepo{
  Future<Either<Failures,PopularPeopleResponseEntity>> getPopularPeople(String pageNumber);
}
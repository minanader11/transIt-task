import 'package:dartz/dartz.dart';
import 'package:transit_task/domain/data_source/popularPeopleDataSource.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/domain/repository/popularPeopleRepo.dart';

class PopularPeopleRepoImpl implements PopularPeopleRepo{
  PopularPeopleRemoteDataSource popularPeopleRemoteDataSource;
  PopularPeopleRepoImpl({required this.popularPeopleRemoteDataSource});
  @override
  Future<Either<Failures, PopularPeopleResponseEntity>> getPopularPeople(String pageNumber) {
  return popularPeopleRemoteDataSource.getPopularPeople(pageNumber);
  }

}
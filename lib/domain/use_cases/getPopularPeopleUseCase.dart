import 'package:dartz/dartz.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/domain/repository/popularPeopleRepo.dart';

class GetPopularPeopleUseCase{
  PopularPeopleRepo popularPeopleRepo;
  GetPopularPeopleUseCase({required this.popularPeopleRepo});
  Future<Either<Failures, PopularPeopleResponseEntity>> invoke(String pageNumber){
    return popularPeopleRepo.getPopularPeople(pageNumber);
  }
}
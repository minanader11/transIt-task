import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:transit_task/data/api/api_manager.dart';
import 'package:transit_task/data/hive/hive_manager.dart';
import 'package:transit_task/data/models/response/PopularPeopleResponseDto.dart';
import 'package:transit_task/domain/data_source/popularPeopleDataSource.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

class PopularPeopleRemoteDataSourceImpl implements PopularPeopleRemoteDataSource{
  PopularPeopleRemoteDataSourceImpl({required this.apiManager});
  ApiManager apiManager;

  @override
  Future<Either<Failures, PopularPeopleResponseEntity>> getPopularPeople(String pageNumber) async{
   var response =await apiManager.getPopularPeople(pageNumber);
  return response.fold((l) {
     return Left(l);
   }, (r){
     return Right(r);
   });
  }
}
class PopularPeopleLocalDataSourceImpl implements PopularPeopleLocalDataSource{
  HiveManager hiveManager;
  PopularPeopleLocalDataSourceImpl({required this.hiveManager});
  @override
  Future<Either<Failures, PopularPeopleResponseEntity>> getPopularPeople() {
   return hiveManager.getPopularPeople();
  }

  @override
  void savePopularPeople(PopularPeopleResponseEntity popularPeopleResponseEntity) async{
  return hiveManager.savePopularPeople(popularPeopleResponseEntity);

  }



}
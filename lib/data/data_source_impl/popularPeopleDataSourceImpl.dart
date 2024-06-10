import 'package:dartz/dartz.dart';
import 'package:transit_task/data/api/api_manager.dart';
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
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:transit_task/domain/data_source/popularPeopleDataSource.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/domain/repository/popularPeopleRepo.dart';

class PopularPeopleRepoImpl implements PopularPeopleRepo{
  PopularPeopleRemoteDataSource popularPeopleRemoteDataSource;

  PopularPeopleRepoImpl({required this.popularPeopleRemoteDataSource,required this.popularPeopleLocalDataSource});
  PopularPeopleLocalDataSource popularPeopleLocalDataSource;
  @override
  Future<Either<Failures, PopularPeopleResponseEntity>> getPopularPeople(String pageNumber)async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)){
      var response = await popularPeopleRemoteDataSource.getPopularPeople(pageNumber);
      return response.fold((l) {
        return Left(l);
      }, (r) {
        popularPeopleLocalDataSource.savePopularPeople(r);
        return Right(r);
      });

     } else{

      return popularPeopleLocalDataSource.getPopularPeople();
    }
  }

}
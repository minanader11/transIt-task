import 'package:transit_task/data/api/api_manager.dart';
import 'package:transit_task/data/data_source_impl/popularPeopleDataSourceImpl.dart';
import 'package:transit_task/data/hive/hive_manager.dart';
import 'package:transit_task/data/repository_impl/popularPeopleRepoImpl.dart';
import 'package:transit_task/domain/data_source/popularPeopleDataSource.dart';
import 'package:transit_task/domain/repository/popularPeopleRepo.dart';
import 'package:transit_task/domain/use_cases/getPopularPeopleUseCase.dart';

GetPopularPeopleUseCase injectGetPopularePeopleUseCase(){
  return GetPopularPeopleUseCase(popularPeopleRepo: injectPopularPeopleRepo());
}
PopularPeopleRepo injectPopularPeopleRepo(){
  return PopularPeopleRepoImpl(popularPeopleRemoteDataSource: injectPopularPeopleRemoteDataSource(),popularPeopleLocalDataSource: injectPopularPeopleLocalDataSource());
}
PopularPeopleRemoteDataSource injectPopularPeopleRemoteDataSource(){
  return PopularPeopleRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
PopularPeopleLocalDataSource injectPopularPeopleLocalDataSource(){
  return PopularPeopleLocalDataSourceImpl(hiveManager: HiveManager.getInstance());
}
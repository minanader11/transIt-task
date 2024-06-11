import 'package:transit_task/data/api/api_manager.dart';
import 'package:transit_task/data/data_source_impl/authentication_data_source_impl.dart';
import 'package:transit_task/data/data_source_impl/popularPeopleDataSourceImpl.dart';
import 'package:transit_task/data/firebase/firebase_utils.dart';
import 'package:transit_task/data/hive/hive_manager.dart';
import 'package:transit_task/data/repository_impl/authentication_repo_impl.dart';
import 'package:transit_task/data/repository_impl/popularPeopleRepoImpl.dart';
import 'package:transit_task/domain/data_source/authentication_data_source.dart';
import 'package:transit_task/domain/data_source/popularPeopleDataSource.dart';
import 'package:transit_task/domain/repository/authentication_repo.dart';
import 'package:transit_task/domain/repository/popularPeopleRepo.dart';
import 'package:transit_task/domain/use_cases/getPopularPeopleUseCase.dart';
import 'package:transit_task/domain/use_cases/loginWithGoogleUseCase.dart';
import 'package:transit_task/domain/use_cases/login_use_case.dart';
import 'package:transit_task/domain/use_cases/register_use_case.dart';

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
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authenticationRepository: injectAuthenticationRepository());
}
AuthenticationRepository injectAuthenticationRepository(){
  return AuthenticationRepoImpl(authenticationDataSource: injectAuthenticationDataSource());
}
AuthenticationDataSource injectAuthenticationDataSource(){
  return AuthenticationDataSourceImpl(firebaseUtils: FirebaseUtils.getInstance());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authenticationRepository: injectAuthenticationRepository());
}
LoginWithGoogleUseCase injectLoginWithGoogleUseCase(){
  return LoginWithGoogleUseCase(authenticationRepository: injectAuthenticationRepository());
}

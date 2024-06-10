import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:transit_task/data/api/api_constants.dart';
import 'package:transit_task/data/models/response/PopularPeopleResponseDto.dart';
import 'package:transit_task/domain/entities/failure.dart';

import 'package:http/http.dart'as http;
class ApiManager{
  static ApiManager? _instance;
  ApiManager._();
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }
Future<Either<Failures,PopularPeopleResponseDto>> getPopularPeople(String pageNumber)async{
  Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularPeopleApi,{'page': pageNumber});

  var response =await http.get(url,headers: {'Authorization': ApiConstants.authorization});
  var popularPeopleResponse=PopularPeopleResponseDto.fromJson(jsonDecode(response.body));
  if(response.statusCode>=200 && response.statusCode <300 ){
    return Right(popularPeopleResponse);
  }else{
    return Left(ServerFailure(errMsg: popularPeopleResponse.statusMessage!));
  }
}
}
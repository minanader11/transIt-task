import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:transit_task/data/models/response/PopularPeopleResponseDto.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

class HiveManager{
  static HiveManager? _instance;
  HiveManager._();
  static HiveManager getInstance() {
    _instance ??= HiveManager._();
    return _instance!;
  }
  void savePopularPeople(PopularPeopleResponseEntity popularPeopleResponseEntity)async{
    var box = await Hive.openBox('popular_people_box');
    box.put('popular_people', popularPeopleResponseEntity);
  }
  Future<Either<Failures, PopularPeopleResponseEntity>> getPopularPeople()async {
    try{
    var box = await Hive.openBox('popular_people_box');
    var response = box.get('popular_people');
    return Right(response);
    }catch (e){
      return Left(HiveFailure(errMsg: e.toString()));
    }
  }
}
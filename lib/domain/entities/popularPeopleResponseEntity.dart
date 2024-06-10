import 'package:hive/hive.dart';
part 'popularPeopleResponseEntity.g.dart';
@HiveType(typeId: 1)
class PopularPeopleResponseEntity extends HiveObject{
  PopularPeopleResponseEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});


  @HiveField(0)
  num? page;
  @HiveField(1)
  List<PersonResponseEntity>? results;
  @HiveField(2)
  num? totalPages;
  @HiveField(3)
  num? totalResults;



}
@HiveType(typeId: 2)
class PersonResponseEntity extends HiveObject{
  PersonResponseEntity({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.knownFor,});

  @HiveField(4)
  bool? adult;
  @HiveField(5)
  num? gender;
  @HiveField(6)
  num? id;
  @HiveField(7)
  String? knownForDepartment;
  @HiveField(8)
  String? name;
  @HiveField(9)
  String? originalName;
  @HiveField(10)
  num? popularity;
  @HiveField(11)
  String? profilePath;
  @HiveField(12)
  List<KnownForResponseEntity>? knownFor;



}
@HiveType(typeId: 3)
class KnownForResponseEntity extends HiveObject{
  KnownForResponseEntity({
      this.backdropPath, 
      this.id, 
      this.originalTitle, 
      this.overview, 
      this.posterPath, 
      this.mediaType, 
      this.adult, 
      this.title, 
      this.originalLanguage, 
      this.genreIds, 
      this.popularity, 
      this.releaseDate, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  @HiveField(13)
  String? backdropPath;
  @HiveField(14)
  num? id;
  @HiveField(15)
  String? originalTitle;
  @HiveField(16)
  String? overview;
  @HiveField(17)
  String? posterPath;
  @HiveField(18)
  String? mediaType;
  @HiveField(19)
  bool? adult;
  @HiveField(20)
  String? title;
  @HiveField(21)
  String? originalLanguage;
  @HiveField(22)
  List<num>? genreIds;
  @HiveField(23)
  num? popularity;
  @HiveField(24)
  String? releaseDate;
  @HiveField(25)
  bool? video;
  @HiveField(26)
  num? voteAverage;
  @HiveField(27)
  num? voteCount;



}
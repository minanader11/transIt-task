class PopularPeopleResponseEntity {
  PopularPeopleResponseEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});


  num? page;
  List<PersonResponseEntity>? results;
  num? totalPages;
  num? totalResults;



}

class PersonResponseEntity {
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


  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  List<KnownForResponseEntity>? knownFor;



}

class KnownForResponseEntity {
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


  String? backdropPath;
  num? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? title;
  String? originalLanguage;
  List<num>? genreIds;
  num? popularity;
  String? releaseDate;
  bool? video;
  num? voteAverage;
  num? voteCount;



}
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

class PopularPeopleResponseDto extends PopularPeopleResponseEntity{
  PopularPeopleResponseDto({
      super.page,
      this.result,
      super.totalPages,
      super.totalResults,
  this.statusCode,this.success,this.statusMessage});

  PopularPeopleResponseDto.fromJson(dynamic json) {
    statusCode=json['status_code'];
    success=json['success'];
    statusMessage=json['status_message'];
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(PersonResponseDto.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
num? statusCode;
  String?statusMessage;
   bool? success;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (result != null) {
      map['results'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
  List<PersonResponseDto>? result;


}

class PersonResponseDto extends PersonResponseEntity {
  PersonResponseDto({
      super.adult,
      super.gender,
      super.id,
      super.knownForDepartment,
      super.name,
      super.originalName,
      super.popularity,
      super.profilePath,
      this.knownForr,});

  PersonResponseDto.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownForResponseDto.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    if (knownForr != null) {
      map['known_for'] = knownForr?.map((v) => v.toJson()).toList();
    }
    return map;
  }
 List<KnownForResponseDto>?knownForr;


}

class KnownForResponseDto extends KnownForResponseEntity {
  KnownForResponseDto({
      super.backdropPath,
      super.id,
      super.originalTitle,
      super.overview,
      super.posterPath,
      super.mediaType,
      super.adult,
      super.title,
      super.originalLanguage,
      super.genreIds,
      super.popularity,
      super.releaseDate,
      super.video,
      super.voteAverage,
      super.voteCount,});

  KnownForResponseDto.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    title = json['title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['adult'] = adult;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}
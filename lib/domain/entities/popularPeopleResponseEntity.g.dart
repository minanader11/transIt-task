// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popularPeopleResponseEntity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularPeopleResponseEntityAdapter
    extends TypeAdapter<PopularPeopleResponseEntity> {
  @override
  final int typeId = 1;

  @override
  PopularPeopleResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularPeopleResponseEntity(
      page: fields[0] as num?,
      results: (fields[1] as List?)?.cast<PersonResponseEntity>(),
      totalPages: fields[2] as num?,
      totalResults: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, PopularPeopleResponseEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularPeopleResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonResponseEntityAdapter extends TypeAdapter<PersonResponseEntity> {
  @override
  final int typeId = 2;

  @override
  PersonResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonResponseEntity(
      adult: fields[4] as bool?,
      gender: fields[5] as num?,
      id: fields[6] as num?,
      knownForDepartment: fields[7] as String?,
      name: fields[8] as String?,
      originalName: fields[9] as String?,
      popularity: fields[10] as num?,
      profilePath: fields[11] as String?,
      knownFor: (fields[12] as List?)?.cast<KnownForResponseEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, PersonResponseEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(4)
      ..write(obj.adult)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.knownForDepartment)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.originalName)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.profilePath)
      ..writeByte(12)
      ..write(obj.knownFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KnownForResponseEntityAdapter
    extends TypeAdapter<KnownForResponseEntity> {
  @override
  final int typeId = 3;

  @override
  KnownForResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownForResponseEntity(
      backdropPath: fields[13] as String?,
      id: fields[14] as num?,
      originalTitle: fields[15] as String?,
      overview: fields[16] as String?,
      posterPath: fields[17] as String?,
      mediaType: fields[18] as String?,
      adult: fields[19] as bool?,
      title: fields[20] as String?,
      originalLanguage: fields[21] as String?,
      genreIds: (fields[22] as List?)?.cast<num>(),
      popularity: fields[23] as num?,
      releaseDate: fields[24] as String?,
      video: fields[25] as bool?,
      voteAverage: fields[26] as num?,
      voteCount: fields[27] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownForResponseEntity obj) {
    writer
      ..writeByte(15)
      ..writeByte(13)
      ..write(obj.backdropPath)
      ..writeByte(14)
      ..write(obj.id)
      ..writeByte(15)
      ..write(obj.originalTitle)
      ..writeByte(16)
      ..write(obj.overview)
      ..writeByte(17)
      ..write(obj.posterPath)
      ..writeByte(18)
      ..write(obj.mediaType)
      ..writeByte(19)
      ..write(obj.adult)
      ..writeByte(20)
      ..write(obj.title)
      ..writeByte(21)
      ..write(obj.originalLanguage)
      ..writeByte(22)
      ..write(obj.genreIds)
      ..writeByte(23)
      ..write(obj.popularity)
      ..writeByte(24)
      ..write(obj.releaseDate)
      ..writeByte(25)
      ..write(obj.video)
      ..writeByte(26)
      ..write(obj.voteAverage)
      ..writeByte(27)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnownForResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

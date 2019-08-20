// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmEntity _$FilmEntityFromJson(Map<String, dynamic> json) {
  return FilmEntity(
    json['total'] as int,
    json['start'] as int,
    (json['subjects'] as List)
        ?.map(
            (e) => e == null ? null : Film.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FilmEntityToJson(FilmEntity instance) =>
    <String, dynamic>{
      'total': instance.total,
      'subjects': instance.subjects,
      'start': instance.start,
    };

Film _$FilmFromJson(Map<String, dynamic> json) {
  return Film(
    json['title'] as String,
    json['mainland_pubdate'] as String,
    (json['casts'] as List)
        ?.map(
            (e) => e == null ? null : Casts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['images'] as Map<String, dynamic>,
    json['id'] as String,
    json['original_title'] as String,
    json['has_video'] as bool,
    json['collect_count'] as int,
    json['rating'] as Map<String, dynamic>,
    (json['directors'] as List)
        ?.map((e) =>
            e == null ? null : Directors.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['alt'] as String,
    json['durations'] as List,
    json['genres'] as List,
    json['pubdates'] as List,
    json['subtype'] as String,
    json['year'] as String,
  );
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'title': instance.title,
      'original_title': instance.original_title,
      'images': instance.images,
      'casts': instance.casts,
      'directors': instance.directors,
      'durations': instance.durations,
      'genres': instance.genres,
      'year': instance.year,
      'mainland_pubdate': instance.mainland_pubdate,
      'pubdates': instance.pubdates,
      'has_video': instance.has_video,
      'rating': instance.rating,
      'id': instance.id,
      'alt': instance.alt,
      'collect_count': instance.collect_count,
      'subtype': instance.subtype,
    };

Casts _$CastsFromJson(Map<String, dynamic> json) {
  return Casts(
    json['name'] as String,
    json['name_en'] as String,
    json['avatars'] as Map<String, dynamic>,
    json['alt'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$CastsToJson(Casts instance) => <String, dynamic>{
      'name': instance.name,
      'name_en': instance.name_en,
      'avatars': instance.avatars,
      'alt': instance.alt,
      'id': instance.id,
    };

Directors _$DirectorsFromJson(Map<String, dynamic> json) {
  return Directors(
    json['alt'] as String,
    json['id'] as String,
    json['name_en'] as String,
    json['avatars'] as Map<String, dynamic>,
    json['name'] as String,
  );
}

Map<String, dynamic> _$DirectorsToJson(Directors instance) => <String, dynamic>{
      'name': instance.name,
      'name_en': instance.name_en,
      'avatars': instance.avatars,
      'alt': instance.alt,
      'id': instance.id,
    };

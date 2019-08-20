//import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';



@JsonSerializable()

class FilmEntity extends Object{

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'subjects')
  List<Film> subjects;

  @JsonKey(name: 'start')
  int start;

  @override

  FilmEntity(this.total, this.start, this.subjects);


  factory FilmEntity.fromJson(Map<String, dynamic> srcJson) => _$FilmEntityFromJson(srcJson);

  Map<String, dynamic> toJson()=>_$FilmEntityToJson(this);
}


@JsonSerializable()

class Film extends Object{
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name:'original_title')
  String original_title;

  @JsonKey(name: 'images')
  Map images;

  @JsonKey(name:'casts')
  List<Casts> casts;

  @JsonKey(name:'directors')
  List<Directors> directors;

  @JsonKey(name: 'durations')
  List durations;

  @JsonKey(name: 'genres')
  List genres;

 @JsonKey(name: 'year')
  String year;

  @JsonKey(name: 'mainland_pubdate')
  String mainland_pubdate;

 @JsonKey(name: 'pubdates')
  List pubdates;

  @JsonKey(name: 'has_video')
  bool has_video;

 @JsonKey(name:'rating')
  Map rating;

 @JsonKey(name:'id')
  String id;

  @JsonKey(name: 'alt')
  String alt;

 @JsonKey(name: 'collect_count')
  int collect_count;

  @JsonKey(name: 'subtype')
  String subtype;


  @override

 Film(this. title, this.mainland_pubdate, this.casts, this.images, this.id, this.original_title, this.has_video,this.collect_count, this.rating, this.directors,this.alt, this.durations, this.genres, this.pubdates, this.subtype, this.year);

  factory Film.fromJson(Map<String, dynamic> srcJson) => _$FilmFromJson(srcJson);

  Map<String, dynamic> toJson()=>_$FilmToJson(this);
}



@JsonSerializable()

class Casts extends Object{

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name:'name_en')
 String name_en;

  @JsonKey(name:'avatars')
 Map avatars;

  @JsonKey(name:'alt')
 String alt;

  @JsonKey(name: 'id')
 String id;

  @override

  Casts(this.name, this.name_en, this.avatars, this.alt, this.id);

  factory Casts.fromJson(Map<String, dynamic> srcJson) => _$CastsFromJson(srcJson);

  Map<String, dynamic> toJson()=>_$CastsToJson(this);



}




@JsonSerializable()

class Directors extends Object{

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name:'name_en')
  String name_en;

 @JsonKey(name:'avatars')
  Map avatars;

  @JsonKey(name:'alt')
  String alt;

  @JsonKey(name: 'id')
  String id;

  @override

 Directors(this.alt, this.id, this.name_en, this.avatars, this.name);

  factory Directors.fromJson(Map<String, dynamic> srcJson) => _$DirectorsFromJson(srcJson);

  Map<String, dynamic> toJson()=>_$DirectorsToJson(this);
}
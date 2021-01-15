// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account()
    ..id = json['id'] as String
    ..avatar = json['avatar'] as String
    ..fullName = json['fullName'] as String
    ..createdAt = json['createdAt'] as String
    ..gender = json['gender'] as String
    ..colors = json['colors'] as List
    ..countries = json['countries'] as List;
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'fullName': instance.fullName,
      'createdAt': instance.createdAt,
      'gender': instance.gender,
      'colors': instance.colors,
      'countries': instance.countries
    };

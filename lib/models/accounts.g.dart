// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accounts _$AccountsFromJson(Map<String, dynamic> json) {
  return Accounts()
    ..accounts = (json['accounts'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AccountsToJson(Accounts instance) =>
    <String, dynamic>{'accounts': instance.accounts};

import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
    Account();

    String id;
    String avatar;
    String fullName;
    String createdAt;
    String gender;
    List colors;
    List countries;
    
    factory Account.fromJson(Map<String,dynamic> json) => _$AccountFromJson(json);
    Map<String, dynamic> toJson() => _$AccountToJson(this);
}

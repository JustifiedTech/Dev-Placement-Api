import 'package:json_annotation/json_annotation.dart';
import "account.dart";
part 'accounts.g.dart';

@JsonSerializable()
class Accounts {
  Accounts();

  List<Account> accounts;

  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsToJson(this);

  static Accounts filterList(Accounts accounts, String filterString) {
    Accounts tempAccounts = accounts;
    List<Account> _accounts = tempAccounts.accounts
        .where((a) =>
            (a.fullName.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    accounts.accounts = _accounts;
    return accounts;
  }
}

import "dart:convert";
import 'package:http/http.dart' as http;
import './models/account.dart';
import './models/accounts.dart';

class Services {
  static const String url =
      "https://android-json-test-api.herokuapp.com/accounts";
  static Future<Accounts> getAccounts() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        return parseAccounts(response.body);
      } else {
        return Accounts();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Accounts();
    }
  }

  static Accounts parseAccounts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Account> accounts = parsed.map<Account>((json) => Account.fromJson(json)).toList();
    Accounts a = Accounts();
    a.accounts = accounts;
    return a;
  }
}

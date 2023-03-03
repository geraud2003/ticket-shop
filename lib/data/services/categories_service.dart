import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/data/models/categorie.dart';
import 'package:ticket_shop/utils/constants.dart';

class CategorieService {
  static Future<Categorie> create(data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().post(Constant.BASE_URL + 'categories',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Categorie.fromJson(response.data['data']);
  }

  static Future<List<Categorie>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'categories',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Categorie.fromJson(x))
        .toList();
  }
}
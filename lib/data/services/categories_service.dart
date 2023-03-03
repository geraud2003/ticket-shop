import 'package:dio/dio.dart';
import 'package:sharedpreference/sharedpreference.dart';
import 'package:ticket_shop/data/models/categorie.dart';
import 'package:ticket_shop/utils/constants.dart';

class CategorieService {
  static Future<Categorie> create(data) async {
    final prefs = await SharedPreference.instance;
    final String token = prefs.get(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().post(Constant.BASE_URL + 'categories',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Categorie.fromJson(response.data['data']);
  }

  static Future<List<Categorie>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreference.instance;
    final String token = prefs.get(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'categories',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Categorie.fromJson(x))
        .toList();
  }
}
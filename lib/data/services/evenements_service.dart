import 'package:dio/dio.dart';
import 'package:ticket_shop/data/models/evenement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/data/models/ticket.dart';
import 'package:ticket_shop/utils/constants.dart';

class EvenementService {
  static Future<Evenement> create(data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().post(Constant.BASE_URL + 'evenements',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Evenement.fromJson(response.data['data']);
  }

  static Future<List<Evenement>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'evenements',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Evenement.fromJson(x))
        .toList();
  }

  static Future<List<Ticket>> getTickets (String evenement_id) async {
    var response = await Dio().get('${Constant.BASE_URL}evenements/$evenement_id/tickets');
    return (response.data!['data'] as List).map((x) => Ticket.fromJson(x))
        .toList();
  }
}
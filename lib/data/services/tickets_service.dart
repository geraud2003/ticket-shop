import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_shop/data/models/ticket.dart';
import 'package:ticket_shop/utils/constants.dart';

class TicketService {
  static Future<Ticket> create(data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().post(Constant.BASE_URL + 'tickets',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Ticket.fromJson(response.data['data']);
  }

  static Future<List<Ticket>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'tickets',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Ticket.fromJson(x))
        .toList();
  }

  static Future<Ticket?> get(String ticket_id) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        '${Constant.BASE_URL}tickets/$ticket_id',
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Ticket.fromJson(response.data!['data']);
  }
}
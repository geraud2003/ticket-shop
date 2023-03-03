import 'package:dio/dio.dart';
import 'package:sharedpreference/sharedpreference.dart';
import 'package:ticket_shop/data/models/ticket.dart';
import 'package:ticket_shop/utils/constants.dart';

class TicketService {
  static Future<Ticket> create(data) async {
    final prefs = await SharedPreference.instance;
    final String token = prefs.get(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().post(Constant.BASE_URL + 'tickets',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Ticket.fromJson(response.data['data']);
  }

  static Future<List<Ticket>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreference.instance;
    final String token = prefs.get(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'tickets',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Ticket.fromJson(x))
        .toList();
  }

  static Future<Ticket?> get(String ticket_id) async {
    final prefs = await SharedPreference.instance;
    final String token = prefs.get(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        '${Constant.BASE_URL}tickets/$ticket_id',
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Ticket.fromJson(response.data!['data']);
  }
}
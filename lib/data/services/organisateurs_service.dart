
import 'package:dio/dio.dart';
import 'package:ticket_shop/data/models/evenement.dart';
import 'package:ticket_shop/utils/constants.dart';

class OrganisateurService {
  static Future<List<Evenement>> getEvenements(String organisateur_id) async {
    var response = await Dio().get('${Constant.BASE_URL}organisateurs/$organisateur_id/evenements');
    return (response.data!['data'] as List).map((x) => Evenement.fromJson(x))
        .toList();
  }

}
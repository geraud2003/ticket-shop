import 'package:ticket_shop/data/models/AuthenticatedUser.dart';
import 'package:dio/dio.dart';
import 'package:ticket_shop/data/models/achat.dart';
import 'package:ticket_shop/data/models/organisateur.dart';
import 'package:ticket_shop/utils/constants.dart';
import 'package:ticket_shop/data/models/user.dart';

class UserService {

  static Future<AuthenticatedUser> authentication (data) async {
    var result = await Dio().post('${Constant.BASE_URL}authentication', data: data);
    return AuthenticatedUser.fromJson(result.data); // + access token
  }

  static Future<User> create (data) async {
    var response = await Dio().post('${Constant.BASE_URL}users', data: data);
    return User.fromJson(response.data['user']) ;
  }

  static Future<Organisateur?> getOrganisateur(String user_id) async {
    var response = await Dio().get('${Constant.BASE_URL}users/$user_id/organisateur');
    return response.data['data'] == null ? null : Organisateur.fromJson(response.data['data']) ;
  }

  static Future<List<Achat?>> getAchats(String user_id) async {
    var response = await Dio().get('${Constant.BASE_URL}users/$user_id/achats');
    return (response.data!['data'] as List).map((x) => Achat.fromJson(x))
        .toList();
  }

}
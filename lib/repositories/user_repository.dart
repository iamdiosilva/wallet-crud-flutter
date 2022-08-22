import 'package:flutter/material.dart';

import '../../database/supabase_handler.dart';
import '../models/user.dart';

class UserRepository {
  UserRepository._();

  static final instance = UserRepository._();

  UserModel? _user;

  UserModel get user => _user!;

  Future<dynamic> searchUser(String user) async {
    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.searchUserHandler(user: user);

    if (response.status == 200) {
      //reponse.data is a Map with the user data decoded from json use directly the data
      _user = UserModel.fromJson(response.data);

      //static variable userId is used to get the user id from the database

    } else {
      debugPrint(response.status.toString());
    }
    return response;
  }
}

import 'package:flutter/material.dart';

import '../database/supabase_handler.dart';
import '../models/user_model.dart';

class UserRepository extends ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  Future<dynamic> searchUser(String user) async {
    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.searchUserHandler(user: user);

    if (response.status == 200) {
      //reponse.data is a Map with the user data decoded from json use directly the data
      _user = UserModel.fromJson(response.data);
    } else {
      debugPrint(response.status.toString());
    }

    notifyListeners();
    return response;
  }
}

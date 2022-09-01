import 'package:flutter/material.dart';

import '../database/supabase_handler.dart';

import '../models/balance.dart';
import 'user_repository.dart';

class BalanceRepository extends ChangeNotifier {
  final List<Balance> _balance = [];

  List get balance => _balance;

  BalanceRepository() {
    _loadBalanceUser();
  }

  Future _loadBalanceUser() async {
    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.searchUserBalanceHandler(
        userId: UserRepository.instance.user.id);

    if (response.status == 200) {
      //reponse.data is a Map with the user data decoded from json use directly the data
      Balance amount = Balance.fromJson(response.data);
      _balance.add(amount);

      //static variable userId is used to get the user id from the database

    } else {
      debugPrint(response.status.toString());
    }
    notifyListeners();
  }
}

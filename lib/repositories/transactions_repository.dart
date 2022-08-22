import 'package:flutter/material.dart';

import '../../database/supabase_handler.dart';
import '../models/transaction.dart';
import 'user_repository.dart';

class TransactionsRepository extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  TransactionsRepository() {
    loadTransactionsUser();
  }

  Future loadTransactionsUser() async {
    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.searchTransactionUserHandler(userId: UserRepository.instance.user.id);

    if (response.status == 200 || response.status == 201) {
      //reponse.data is a Map with the user data decoded from json use directly the data
      List<dynamic> jsonList = response.data;
      for (var transaction in jsonList) {
        _transactions.add(Transaction.fromJson(transaction));
      }
    } else {
      debugPrint(response.status.toString());
      debugPrint(response.error.toString());
    }

    notifyListeners();
  }

  Future<dynamic> makeTransaction(Transaction transaction) async {
    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.transactionHandler(
      userId: transaction.userId,
      description: transaction.description!,
      category: transaction.category,
      amount: transaction.amount,
      type: transaction.type,
      iconPath: transaction.iconPath,
    );

    _refreshTransactions();
    return response;
  }

  _refreshTransactions() {
    _transactions.clear();
    loadTransactionsUser();
  }
}

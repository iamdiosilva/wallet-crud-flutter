import 'package:wallet_crud/models/enum/e_transaction_type.dart';

import '../core/theme/app_icons.dart';
import '../models/enum/e_transaction_category.dart';
import '../models/transaction.dart';
import '../repositories/user_repository.dart';

class DebitPageController {
  List<String> getCategoryList() {
    return <String>[
      ETransactionCategory.Transport.name,
      ETransactionCategory.Food.name,
      ETransactionCategory.Home.name,
      ETransactionCategory.Shopping.name,
      ETransactionCategory.Other.name,
    ];
  }

  Transaction debitTransaction({required String amount, required String category, required String description}) {
    String appIcon = '${ETransactionType.Debit.name}_$category';

    if (category == ETransactionCategory.Food.name) appIcon = AppIcons.httpFood;
    if (category == ETransactionCategory.Home.name) appIcon = AppIcons.httpHome;

    return Transaction(
      userId: UserRepository.instance.user.id,
      category: category,
      amount: double.parse(amount) * -1,
      description: description,
      type: ETransactionType.Debit.name,
      iconPath: appIcon,
    );
  }
}

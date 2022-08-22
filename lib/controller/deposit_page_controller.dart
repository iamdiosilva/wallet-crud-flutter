import '../core/theme/app_icons.dart';
import '../models/enum/e_transaction_category.dart';
import '../models/enum/e_transaction_type.dart';
import '../models/transaction.dart';
import '../repositories/user_repository.dart';

class DepositPageController {
  //return a object with deposit data
  Transaction depositTransaction({required String amount, required String description}) {
    return Transaction(
      userId: UserRepository.instance.user.id,
      category: ETransactionCategory.Deposit.name,
      amount: double.parse(amount),
      description: description,
      type: ETransactionType.Credit.name,
      iconPath: AppIcons.httpDeposit,
    );
  }
}

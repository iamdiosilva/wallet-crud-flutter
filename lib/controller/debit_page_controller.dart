import 'package:wallet_crud/models/enum/e_transaction_type.dart';

import '../core/theme/app_icons.dart';
import '../models/enum/e_transaction_category.dart';
import '../models/transaction.dart';
import '../repositories/user_repository.dart';

class DebitPageController {
  List<String> getCategoryList() {
    return <String>[
      ETransactionCategory.Transport.name,
      ETransactionCategory.Snackbar.name,
      ETransactionCategory.Restaurant.name,
      ETransactionCategory.Health.name,
      ETransactionCategory.Dentist.name,
      ETransactionCategory.Fuel.name,
      ETransactionCategory.Rent.name,
      ETransactionCategory.Gym.name,
      ETransactionCategory.Hygiene.name,
      ETransactionCategory.Home.name,
      ETransactionCategory.Shopping.name,
      ETransactionCategory.Other.name,
      ETransactionCategory.Internet.name,
      ETransactionCategory.Light.name,
      ETransactionCategory.Phone.name,
      ETransactionCategory.Market.name,
    ]..sort();
  }

  Transaction debitTransaction({required String amount, required String category, required String description}) {
    String appIcon = '${ETransactionType.Debit.name}_$category';

    if (category == ETransactionCategory.Snackbar.name) appIcon = AppIcons.httpSnackbar;
    if (category == ETransactionCategory.Restaurant.name) appIcon = AppIcons.httpRestaurant;
    if (category == ETransactionCategory.Home.name) appIcon = AppIcons.httpHome;
    if (category == ETransactionCategory.Shopping.name) appIcon = AppIcons.httpShoppingBag;
    if (category == ETransactionCategory.Transport.name) appIcon = AppIcons.httpTransport;
    if (category == ETransactionCategory.Other.name) appIcon = AppIcons.httpOther;
    if (category == ETransactionCategory.Rent.name) appIcon = AppIcons.httpRent;
    if (category == ETransactionCategory.Internet.name) appIcon = AppIcons.httpModem;
    if (category == ETransactionCategory.Light.name) appIcon = AppIcons.httpEletrical;
    if (category == ETransactionCategory.Health.name) appIcon = AppIcons.httpFirstAid;
    if (category == ETransactionCategory.Dentist.name) appIcon = AppIcons.httpDentist;
    if (category == ETransactionCategory.Phone.name) appIcon = AppIcons.httpPhone;
    if (category == ETransactionCategory.Fuel.name) appIcon = AppIcons.httpGasStation;
    if (category == ETransactionCategory.Gym.name) appIcon = AppIcons.httpGym;
    if (category == ETransactionCategory.Market.name) appIcon = AppIcons.httpTrolley;
    if (category == ETransactionCategory.Hygiene.name) appIcon = AppIcons.httpHygiene;

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

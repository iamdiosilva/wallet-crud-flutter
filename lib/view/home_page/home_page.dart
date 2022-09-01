import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:wallet_crud/models/transaction.dart';
import 'package:wallet_crud/view/util/filter_date_component.dart';
import 'package:widget_loading/widget_loading.dart';

import '../../controller/home_page_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../repositories/balance_repository.dart';
import '../../repositories/transactions_repository.dart';
import '../../repositories/user_repository.dart';
import '../modal_sheet_views/modal_bottom_sheet_view.dart';
import '../util/card_model.dart';
import '../util/list_tile_transactions.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey _scaffold = GlobalKey();
  final PageController pCardsController = PageController(viewportFraction: 0.9);

  late TransactionsRepository _transactionsRepository;
  late BalanceRepository _balanceRepository;
  late List<Transaction> transactionsReversed;

  //Controller
  final homeController = HomePageController();

  @override
  Widget build(BuildContext context) {
    _transactionsRepository = context.watch<TransactionsRepository>();
    _balanceRepository = context.watch<BalanceRepository>();
    transactionsReversed =
        _transactionsRepository.transactions.reversed.toList();

    return Scaffold(
      key: _scaffold,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalBottomSheetView(_scaffold.currentContext!),
        backgroundColor: AppColors.baseColor200,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColors.baseColor200,
        child: IconTheme(
          data: IconThemeData(color: AppColors.baseColor),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
      backgroundColor: AppColors.baseColor,
      body: SafeArea(
        //App bar
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${UserRepository.instance.user.nickname} ',
                            style: AppTextStyles.homeLabelBold),
                        Text('Wallet', style: AppTextStyles.homeLabel),
                      ],
                    ),
                    //Add button
                  ],
                ),
              ),
              const SizedBox(height: 12),

              (_balanceRepository.balance == null)
                  ? WiperLoading(
                      wiperColor: AppColors.baseColor200,
                      child: (SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.95,
                      )),
                    )
                  : SquarePercentIndicator(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.95,
                      progressColor: Colors.tealAccent,
                      progress: 0.3,
                      borderRadius: 15,
                      child: CardModel(
                        color: AppColors.baseColor200,
                        balance: _balanceRepository.balance!,
                      ),
                    ),
              const SizedBox(height: 16),

              //Filter
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FilterItemComponent(label: 'Today'),
                    FilterItemComponent(label: 'This week'),
                    FilterItemComponent(label: 'This month'),
                    FilterItemComponent(label: 'This year'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //transactions
              (_transactionsRepository.transactions.isEmpty)
                  ? Expanded(
                      child: WiperLoading(
                          wiperColor: AppColors.baseColor200,
                          direction: WiperDirection.down,
                          child: Container()),
                    )
                  : Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Weekend Transactions',
                              style: AppTextStyles.homeTitles,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: transactionsReversed.length,
                              itemBuilder: (context, index) =>
                                  ListTileTransaction(
                                      transaction: transactionsReversed[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

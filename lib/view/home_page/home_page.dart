import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:wallet_crud/models/transaction.dart';
import 'package:wallet_crud/view/modal_sheet_views/modal_transaction_sheet_view.dart';
import 'package:wallet_crud/view/util/filter_date_component.dart';
import 'package:widget_loading/widget_loading.dart';

import '../../controller/home_page_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../repositories/balance_repository.dart';
import '../../repositories/transactions_repository.dart';
import '../../repositories/user_repository.dart';
import '../modal_sheet_views/modal_bottom_sheet_view.dart';
import '../modal_sheet_views/modal_pages/extract_page.dart';
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
        child: RefreshIndicator(
          backgroundColor: AppColors.baseColor200,
          color: AppColors.grey300,
          onRefresh: () async {
            await _transactionsRepository.refreshTransactions();
            await _balanceRepository.refreshBalance();
          },
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

                //Cards
                WiperLoading(
                  loading: (_balanceRepository.balance == null),
                  wiperColor: AppColors.baseColor200,
                  child: SquarePercentIndicator(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.95,
                    progressColor: Colors.tealAccent,
                    progress: 0.3,
                    borderRadius: 15,
                    child: CardModel(
                      balance: (_balanceRepository.balance == null)
                          ? null
                          : _balanceRepository.balance!,
                      color: AppColors.baseColor200,
                    ),
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

                //Transactions
                Expanded(
                  child: WiperLoading(
                    loading: _transactionsRepository.transactions.isEmpty,
                    direction: WiperDirection.down,
                    wiperColor: AppColors.baseColor200,
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
                              transaction: transactionsReversed[index],
                              onTap: () => modalTransactionSheetView(
                                context: context,
                                page: ExtractPage(
                                  transaction: transactionsReversed[index],
                                ),
                                popBefore: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

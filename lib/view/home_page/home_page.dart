import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_crud/models/transaction.dart';

import '../../controller/home_page_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
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
  late List<Transaction> transactionsReversed;

  //Controller
  final homeController = HomePageController();

  @override
  Widget build(BuildContext context) {
    _transactionsRepository = context.watch<TransactionsRepository>();
    transactionsReversed = _transactionsRepository.transactions.reversed.toList();

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
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
      backgroundColor: AppColors.baseColor,
      body: SafeArea(
        //App bar
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${UserRepository.instance.user.nickname} ', style: AppTextStyles.homeLabelBold),
                        Text('Wallet', style: AppTextStyles.homeLabel),
                      ],
                    ),
                    //Add button
                  ],
                ),
              ),
              const SizedBox(height: 25),

              //cards
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: PageView(
                  controller: pCardsController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardModel(
                      color: Colors.teal,
                    ),
                    CardModel(
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: pCardsController,
                count: 2,
                effect: ExpandingDotsEffect(
                  dotColor: AppColors.baseColor300,
                  activeDotColor: AppColors.baseColor200,
                ),
              ),
              const SizedBox(height: 25),

              //buttons column stats transactions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Weekend Transactions',
                      style: AppTextStyles.homeTitles,
                    ),
                  ],
                ),
              ),

              //transactions
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: transactionsReversed.length,
                    itemBuilder: (context, index) => ListTileTransaction(transaction: transactionsReversed[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

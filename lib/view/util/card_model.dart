import 'package:flutter/material.dart';
import '../../controller/universal_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/balance.dart';

class CardModel extends StatefulWidget {
  //final Balance? balance;
  final Color? color;
  final Balance? balance;
  const CardModel({
    Key? key,
    required this.color,
    required this.balance,
  }) : super(key: key);

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  bool _isVisible = false;

  final _universalController = UniversalController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Balance:',
                  style: AppTextStyles.cardText,
                ),
                Row(
                  children: [
                    (_isVisible)
                        ? (widget.balance == null)
                            ? const CircularProgressIndicator()
                            : Text(
                                _universalController.numberFormatPTBR
                                    .format(widget.balance!.balance),
                                style: AppTextStyles.balanceText,
                                overflow: TextOverflow.fade,
                              )
                        : Row(
                            children: [
                              Text(
                                'R\$',
                                style: AppTextStyles.balanceText,
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(
                                child: Text(
                                  ' • • • • • • • •',
                                  style: AppTextStyles.balanceText,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (_isVisible)
                    ? IconButton(
                        icon: const Icon(Icons.visibility),
                        iconSize: 30,
                        color: AppColors.grey300,
                        onPressed: () {
                          setState(() {
                            _isVisible = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.visibility_off),
                        iconSize: 30,
                        color: AppColors.grey300,
                        onPressed: () {
                          setState(
                            () {
                              _isVisible = true;
                            },
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

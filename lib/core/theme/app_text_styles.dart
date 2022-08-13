import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle homeLabel = const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300);
  static TextStyle homeTitles = const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300);
  static TextStyle homeLabelBold = const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle cardText = const TextStyle(color: Colors.white);
  static TextStyle balanceText = const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle buttonLabel = TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500);

  static TextStyle listTileTitle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle listTileSubtitle = const TextStyle(fontSize: 12, color: Colors.white54);

  static TextStyle listTileTransactions = const TextStyle(color: Colors.white);
  static TextStyle listTileTransactionsData = const TextStyle(color: Colors.white, fontSize: 12);
  static TextStyle listTileTransactionsValueCredit = const TextStyle(color: Color(0xff2BC48A), fontSize: 16);
  static TextStyle listTileTransactionsValueDebit = const TextStyle(color: Colors.red, fontSize: 16);

  static TextStyle textFormLabel = const TextStyle(color: Colors.white38, fontSize: 16);
  static TextStyle textButton = const TextStyle(fontSize: 20, color: Colors.white70);

  static TextStyle modalTransactionsTitle = const TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle alertDialogTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle alertDialogContent = const TextStyle(fontSize: 14, color: Colors.white54);
  static TextStyle alertDialogTextButton = const TextStyle(color: Colors.white);
}

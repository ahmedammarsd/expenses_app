import 'package:expenses_app/colors/colors.dart';
import 'package:flutter/material.dart';

class DetailsTotalMoneyBank extends StatelessWidget {
  final String? logo;
  final String nameBank;
  final String typeCurrency;
  final String totalMony;
  const DetailsTotalMoneyBank(
      {super.key,
      this.logo,
      required this.nameBank,
      required this.typeCurrency,
      required this.totalMony});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhiteOne,
      ),
      child: Column(
        children: [
          if (logo != "") Image.asset("assets/$logo"),
          if (logo == "") Text(nameBank),
          const SizedBox(
            height: 20,
          ),
          Text(typeCurrency),
          Text(totalMony)
        ],
      ),
    );
  }
}

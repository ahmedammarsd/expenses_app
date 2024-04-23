import 'package:expenses_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailsTotalMoneyBank extends StatelessWidget {
  final String? logo;
  final String nameBank;
  final String typeCurrency;
  final int totalMony;
  const DetailsTotalMoneyBank(
      {super.key,
      this.logo = "",
      required this.nameBank,
      required this.typeCurrency,
      required this.totalMony});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(15.dg),
      width: 190.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kWhiteOne,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logo != "")
            Image.asset(
              "assets/$logo",
              width: 120.w,
              height: 45.h,
            ),
          if (logo == "")
            Column(
              children: [
                Text(
                  nameBank,
                  style: TextStyle(
                      color: kPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            typeCurrency,
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          Text(
            formatCurrency.format(totalMony),
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: kPrimary,
                overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }
}

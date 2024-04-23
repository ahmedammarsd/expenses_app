import 'package:expenses_app/widgets/details_total_money_bank.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          DetailsTotalMoneyBank(
              //logo: "logo_new_ar.png",
              nameBank: "khartoum Bank",
              typeCurrency: "SDG",
              totalMony: 10000)
        ],
      ),
    );
  }
}

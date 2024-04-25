import 'package:expenses_app/screens/home.dart';
import 'package:expenses_app/screens/statistics.dart';
import 'package:expenses_app/screens/topics.dart';
import 'package:expenses_app/widgets/custome_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class TabsControllerScreen extends StatefulWidget {
  const TabsControllerScreen({super.key});

  @override
  State<TabsControllerScreen> createState() => _TabsControllerScreenState();
}

int selectetNavScreenIndex = 0;
List<Widget> screens = [
  const HomePage(),
  const Statistics(),
  const Topics(),
];

class _TabsControllerScreenState extends State<TabsControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CustomeBottomAppBar(
        selectedIndexScreen: selectetNavScreenIndex,
        onSelected: (int index) {
          selectetNavScreenIndex = index;
          setState(() {});
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: screens[selectetNavScreenIndex],
      ),
    );
  }
}


//  const Column(
//         children: [
//           DetailsTotalMoneyBank(
//             //logo: "logo_new_ar.png",
//             nameBank: "khartoum Bank",
//             typeCurrency: "SDG",
//             totalMony: 10000,
//           ),
//         ],
//       ),
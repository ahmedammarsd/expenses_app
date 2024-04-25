import 'dart:io';

import 'package:expenses_app/colors/colors.dart';
import 'package:expenses_app/models/nav_bottom_bar_models.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomeBottomAppBar extends StatefulWidget {
  final int selectedIndexScreen;
  final Function(int indexForSelected) onSelected;
  const CustomeBottomAppBar(
      {super.key, required this.onSelected, required this.selectedIndexScreen});

  @override
  State<CustomeBottomAppBar> createState() => _CustomeBottomAppBarState();
}

class _CustomeBottomAppBarState extends State<CustomeBottomAppBar> {
  // int seletedIndexScreen = 0;
  List<NavItem> navItems = [
    NavItem("Home", "home", 0),
    NavItem("Statistics", "statics", 1),
    NavItem("Topics", "list", 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 66.h : 60.h,
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 6.h : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 0.9,
            offset: const Offset(0, 1),
            color: Colors.grey.shade100,
          ),
        ],
      ),
      child: Row(
        children: [
          ...navItems.map(
            (item) => Expanded(
              child: NavigatorButtonItem(
                index: item.index,
                lable: item.lable,
                svgIcon: item.svgIcon,
                selectedIndex: widget.selectedIndexScreen,
                onSelect: () {
                  // seletedIndexScreen = item.index;
                  widget.onSelected(item.index);
                  setState(() {});
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NavigatorButtonItem extends StatelessWidget {
  final String lable;
  final String svgIcon;
  final int index;
  final int selectedIndex;
  final Function() onSelect;
  const NavigatorButtonItem({
    super.key,
    required this.lable,
    required this.svgIcon,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.grey.shade100),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: () {
        onSelect();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/bottom_app_bar/$svgIcon.svg",
            width: 25,
            height: 25,
            color: index == selectedIndex ? kPrimary : Colors.grey.shade500,
          ),
          Text(
            lable,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selectedIndex == index ? kPrimary : Colors.grey.shade500,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

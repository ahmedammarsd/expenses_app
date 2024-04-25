import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeBottomAppBar extends StatefulWidget {
  const CustomeBottomAppBar({super.key});

  @override
  State<CustomeBottomAppBar> createState() => _CustomeBottomAppBarState();
}

class _CustomeBottomAppBarState extends State<CustomeBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 66.h : 60.h,
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 6.h : 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 0.9,
            offset: const Offset(0, -1),
            color: Colors.grey.shade100,
          ),
        ],
      ),
      child: const Row(
        children: [],
      ),
    );
  }
}

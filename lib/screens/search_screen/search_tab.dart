import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/search_screen/search_delegate.dart';

import '../../core/assets_manager.dart';
import '../../core/colors_manager.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: ColorsManager.darkGrey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
                AssetsManager.search,
                width: 104.w,
                height: 114.h,
              ))
        ],
      ),
    );
  }
}
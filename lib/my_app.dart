import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes_manager.dart';
import 'package:movies_app/screens/browse_screen/view/view.dart';
import 'package:movies_app/screens/home_screen/home_screen.dart';
import 'package:movies_app/screens/search_screen/search_tab.dart';
import 'package:movies_app/screens/splash_screen/splash_screen.dart';
import 'package:movies_app/screens/watch_list/watch_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit (
      designSize: Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RoutesManager.HomeScreen: (context)=> HomeTabView(),
          RoutesManager.SplashScreen: (context)=> SplashScreen(),
          RoutesManager.SearchScreen: (context)=> SearchTab(),
          RoutesManager.WatchList: (context)=> WatchListTab(),
          RoutesManager.BrowseScreen: (context)=> BrowsetabView(),
      
      
        },
        initialRoute: RoutesManager.SplashScreen,
      ),
    );
  }
}

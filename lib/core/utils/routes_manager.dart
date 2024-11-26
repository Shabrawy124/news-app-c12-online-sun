import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/presentation/screens/article_details_screen/article_details.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/home.dart';
import 'package:news_app_c12_online_sun/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articleDetails = '/articleDetails';
static Map<String ,WidgetBuilder>routes={
  splash :(_)=>Splash(),
  home :(_)=>Home(),
  articleDetails :(_)=>ArticleDetails(),
};
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/core/utils/assets_manager.dart';
import 'package:news_app_c12_online_sun/data/model/articles_response/Article.dart';
import 'package:news_app_c12_online_sun/data/model/articles_response/Articles_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/colors_manager.dart';

final Uri _url = Uri.parse('https://newsapi.org');

class ArticleDetails extends StatelessWidget {
   ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    return Container(
      decoration:const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
        appBar: AppBar(title: Text(article.title ??''),),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 18,horizontal: 4),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.network(article.urlToImage ?? ''),
                ),
                Text(
                  article.source?.name ?? '',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: ColorsManager.grey),
                ),
                SizedBox(height: 4.h),
                Text(article.description ?? '',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black)),
                SizedBox(height: 4.h),
                Text(
                  article.publishedAt ?? '',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: ColorsManager.grey),
                  textAlign: TextAlign.end,
                ),
                Text(
                  article.content ?? '',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: ColorsManager.grey),
                  textAlign: TextAlign.start,
                ),
                TextButton(onPressed: (){
                  _launchUrl();
                }, child: Text('view'))
              ]),
        ),
      ),
    );
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/routes_manager.dart';
import 'package:news_app_c12_online_sun/data/model/articles_response/Article.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.pushNamed(context, RoutesManager.articleDetails,arguments: article );
    },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
            ]),
      ),
    );
  }
}

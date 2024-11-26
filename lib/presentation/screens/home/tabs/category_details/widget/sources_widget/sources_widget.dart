import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/model/articles_response/Article.dart';
import 'package:news_app_c12_online_sun/data/model/sources_response/Source.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/category_details/widget/sources_widget/source_item_widget.dart';

import '../../../news/articles_list_widget.dart';

class SourcesWidget extends StatefulWidget {

  SourcesWidget({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.all(7),
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources
                .map((source) => SourceItemWidget(
                      source: source,
                      isSelected: widget.sources.indexOf(source )==selectedIndex,
                    ))
                .toList(),
          ),
        ),
        ArticlesListWidget(source :widget.sources[selectedIndex])

      ],
    );
  }
}

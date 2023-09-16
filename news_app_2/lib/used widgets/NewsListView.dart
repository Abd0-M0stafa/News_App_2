import 'package:flutter/material.dart';

import '../models/getNewsModel.dart';
import 'used_widgets.dart';

class NewsListView extends StatelessWidget {
  final List<GetNewsModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: NewsCard(
              getNewsModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}

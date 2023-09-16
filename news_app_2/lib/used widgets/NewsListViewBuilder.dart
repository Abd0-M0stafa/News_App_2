import 'package:flutter/material.dart';
import 'package:news_app_2/models/getNewsModel.dart';

import '../services/getNewsService.dart';
import 'NewsListView.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.catigoty});
  final String catigoty;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(catigory: widget.catigoty);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetNewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('oops, thier is somthing wrong'),
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

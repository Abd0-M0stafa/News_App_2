import 'package:flutter/material.dart';
import 'package:news_app_2/used%20widgets/used_widgets.dart';

import '../used widgets/NewsListViewBuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CatigoriesListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  '- HOT UPDATES -',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            NewsListViewBuilder(catigoty: 'general'),
          ],
        ),
      ),
    );
  }
}

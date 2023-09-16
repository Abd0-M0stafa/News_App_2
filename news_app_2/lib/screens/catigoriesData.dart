import 'package:flutter/material.dart';

import '../used widgets/NewsListViewBuilder.dart';

class CatigoriesData extends StatelessWidget {
  const CatigoriesData({super.key, required this.carigory});
  final String carigory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Center(
                    child: Text(
                  'Catigory Hot News',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )),
              ),
            ),
            NewsListViewBuilder(
              catigoty: carigory,
            ),
          ],
        ),
      ),
    );
  }
}

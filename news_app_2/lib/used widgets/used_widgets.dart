import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/models/getNewsModel.dart';

import '../screens/catigoriesData.dart';

List<Map<String, String>> catigoriesData = [
  {'image': 'assets/images/business.png', 'name': 'business'},
  {'image': 'assets/images/science.jpg', 'name': 'science'},
  {'image': 'assets/images/health.jpg', 'name': 'health'},
  {'image': 'assets/images/sports.jpg', 'name': 'sports'},
  {'image': 'assets/images/technology.jpg', 'name': 'technology'},
];

class CatigoryCard extends StatelessWidget {
  final String image;
  final String name;
  const CatigoryCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CatigoriesData(
              carigory: name,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: Container(
          height: 150,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CatigoriesListView extends StatelessWidget {
  const CatigoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CatigoryCard(
              image: catigoriesData[index]['image']!,
              name: catigoriesData[index]['name']!);
        },
        itemCount: catigoriesData.length,
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.getNewsModel});

  final GetNewsModel getNewsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: getNewsModel.image ??
                'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Color.fromARGB(255, 209, 44, 32),
                  ),
                  Text(
                    'No image yet',
                    style: TextStyle(
                      color: Color.fromARGB(255, 209, 44, 32),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              getNewsModel.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            getNewsModel.subTitle ?? 'Null SubTitle',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

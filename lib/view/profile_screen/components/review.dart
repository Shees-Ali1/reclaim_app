import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reclaim_app/const/color.dart';
import 'package:reclaim_app/widgets/custom_text.dart';

import '../../../helper/loading.dart';
import '../../../widgets/custom_appbar.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar1(
        homeController: homeController,
        text: 'Reviews',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ratings Overview
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text('Seller Review',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: 4.5,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(width: 10),
                      Text('4.5 out of 5', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Rating Breakdown
                  RatingBreakdown(),
                ],
              ),
            ),
            SizedBox(height: 10),

            Text('User Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            Divider(),
            SizedBox(height: 5),

            // User Reviews
            Expanded(child: UserReviewsList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {},
        label: InterCustomText(
          text: 'Write Review',
          textColor: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        icon: Icon(Icons.edit),
      ),
    );
  }
}

class RatingBreakdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRatingRow(5, 60),
        buildRatingRow(4, 35),
        buildRatingRow(3, 15),
        buildRatingRow(2, 10),
        buildRatingRow(1, 25),
      ],
    );
  }

  Widget buildRatingRow(int starCount, int percentage) {
    return Row(
      children: [
        Text('$starCount star'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              minHeight: 10,
              value: percentage / 100,
              backgroundColor: Colors.grey[200],
              color: Colors.amber,
            ),
          ),
        ),
        Text('$percentage%'),
      ],
    );
  }
}

class UserReviewsList extends StatelessWidget {
  final List<Map<String, String>> reviews = [
    {
      'name': 'Ryosuke Tanaka',
      'date': 'August 5, 2023',
      'review':
          'This app offers an impressive array of features and resources.',
    },
    // Add more reviews here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // User image URL
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviews[index]['name']!),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 5.0,
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(reviews[index]['date']!,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(reviews[index]['review']!),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 24),
                SizedBox(width: 5),
                Text('36'),
                SizedBox(width: 10),
                Icon(Icons.reply, size: 24),
                SizedBox(width: 5),
                Text('Reply'),
                Spacer(),
                Icon(Icons.favorite_border, size: 24),
                SizedBox(width: 5),



              ],
            ),
          ],
        );
      },
    );
  }
}

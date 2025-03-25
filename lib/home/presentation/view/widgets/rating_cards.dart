import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class RatingCards extends StatelessWidget {
  final int itemCount; 
  const RatingCards({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    const double ratingValue = 4.5; 
    const String reviewText =
        "Informing Customers About Offers Logging Customer Complaints";
    
    final List<Map<String, dynamic>> ratings = List.generate(
      itemCount,
      (index) => {"rating": ratingValue, "reviews": reviewText},
    );

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ratings.length,
        itemBuilder: (context, index) {
          final rating = ratings[index];

          return IntrinsicWidth(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 250, 230),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          rating["rating"].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Text(
                      rating["reviews"],
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

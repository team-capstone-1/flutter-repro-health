import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CommentCard extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String comment;
  const CommentCard({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 40,
            height: 40,
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: medium12Black,
                ),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: regular8Black,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              comment,
              style: regular10Black,
            )
          ],
        )
      ],
    );
  }
}

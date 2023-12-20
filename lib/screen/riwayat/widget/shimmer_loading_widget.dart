import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:reprohealth_app/theme/theme.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 14,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: grey50,
          highlightColor: grey10,
          child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            height: 100,
            child: ListTile(
              tileColor: grey10,
              leading: const CircleAvatar(),
              title: Container(
                height: 12,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: grey50,
                ),
              ),
              subtitle: Container(
                height: 10,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: grey50,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

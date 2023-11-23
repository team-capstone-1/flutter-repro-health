import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String title;
  final String profileImage;
  final String name;
  final String date;
  final VoidCallback? onPressedIcon;
  final bool showIcon;
  final bool isSelected;
  final Icon selectedIcon;
  final Icon unselectedIcon;

  const ArticleCard({
    required this.image,
    required this.title,
    required this.profileImage,
    required this.name,
    required this.date,
    this.onPressedIcon,
    Key? key,
    required this.isSelected,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.showIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 225,
                child: Text(
                  title,
                  style: semiBold12Black400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      profileImage,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.only(right: 112),
                    child: Column(
                      children: [
                        Text(name, style: medium10Black500),
                        Text(
                          date,
                          style: regular8Black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  showIcon
                      ? GestureDetector(
                          onTap: onPressedIcon,
                          child: isSelected ? selectedIcon : unselectedIcon,
                        )
                      : const SizedBox(
                          width: 40,
                        )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

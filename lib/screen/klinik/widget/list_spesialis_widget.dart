import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ListSpesialisWidget extends StatelessWidget {
  final List<SpesialisModels> spesialisInterMedikaList;
  const ListSpesialisWidget({
    Key? key,
    required this.spesialisInterMedikaList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: spesialisInterMedikaList.length.clamp(0, 5),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesNavigation.detailSpesialisView);
          },
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  spesialisInterMedikaList[index].image,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Text(
                  spesialisInterMedikaList[index].spesialis,
                  style: medium12Grey900,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

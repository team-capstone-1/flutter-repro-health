import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/onboarding_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  late PageController _onBoaringController;

  @override
  void initState() {
    _onBoaringController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _onBoaringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesNavigation.choiceView,
                (route) => false,
              );
            },
            child: Text(
              'Lewati',
              style: semiBold14Black,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: PageView.builder(
        controller: _onBoaringController,
        itemCount: onBoardingListData.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, int index) {
          final data = onBoardingListData[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 86, bottom: 70),
                    child: data.image,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardingListData.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 16,
                      right: 16,
                      bottom: 10,
                    ),
                    child: Text(
                      data.title,
                      style: bold24Grey500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    child: Text(
                      data.description,
                      style: regular10Primary200,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 28,
                ),
                child: ButtonComponent(
                  labelText: currentIndex == onBoardingListData.length - 1
                      ? 'Mulai'
                      : 'Selanjutnya',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () {
                    if (currentIndex == onBoardingListData.length - 1) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation.choiceView,
                        (route) => false,
                      );
                    } else {
                      _onBoaringController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: green500,
      ),
    );
  }
}

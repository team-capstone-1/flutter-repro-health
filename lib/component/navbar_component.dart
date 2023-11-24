import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/home/home_view_models.dart';

Widget customBottomNav() {
  return Container(
    color: Colors.white,
    child: Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: Provider.of<HomeViewModels>(context).currentIndex,
              onTap: (value) {
                Provider.of<HomeViewModels>(context, listen: false)
                    .updateIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/Appoinment.png',
                      width: 100,
                      color:
                          Provider.of<HomeViewModels>(context).currentIndex == 0
                              ? const Color(0xff14C6A4)
                              : const Color(0xff989898),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/Article.png',
                      width: 100,
                      color:
                          Provider.of<HomeViewModels>(context).currentIndex == 1
                              ? const Color(0xff14C6A4)
                              : const Color(0xff989898),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/Forum.png',
                      width: 100,
                      color:
                          Provider.of<HomeViewModels>(context).currentIndex == 2
                              ? const Color(0xff14C6A4)
                              : const Color(0xff989898),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/Riwayat.png',
                      width: 100,
                      color:
                          Provider.of<HomeViewModels>(context).currentIndex == 3
                              ? const Color(0xff14C6A4)
                              : const Color(0xff989898),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/Profile.png',
                      width: 100,
                      color:
                          Provider.of<HomeViewModels>(context).currentIndex == 4
                              ? const Color(0xff14C6A4)
                              : const Color(0xff989898),
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
          // ),
        );
      },
    ),
  );
}

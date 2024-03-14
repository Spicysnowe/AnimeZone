import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/presentation/state/bottom_navigation_state.dart';
import 'package:anime_zone/presentation/views/navigation/home.dart';
import 'package:anime_zone/presentation/views/navigation/nav_button.dart';
import 'package:anime_zone/presentation/views/navigation/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Widget> widgetOptions = [
  const Home(),
  const Search(),
  const Profile()
];

class BottomNavigation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationProvider);
   //TODO: Add will popscope
    return Scaffold(
      backgroundColor: black1,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: widgetOptions.elementAt(currentIndex),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(0),
                  iconDataActive: Icons.home,
                  iconDataInActive: Icons.home_outlined,
                  index: 0,
                  currentIndex: currentIndex,
                ),
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(1),
                  iconDataActive: Icons.search,
                  iconDataInActive: Icons.search_off,
                  index: 1,
                  currentIndex: currentIndex,
                ),
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(2),
                  iconDataActive: Icons.person,
                  iconDataInActive: Icons.person_outline,
                  index: 2,
                  currentIndex: currentIndex,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/presentation/state/bottom_navigation_state.dart';
import 'package:anime_zone/presentation/views/navigation/home.dart';
import 'package:anime_zone/presentation/views/navigation/nav_button.dart';
import 'package:anime_zone/presentation/views/navigation/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Widget> widgetOptions = [
  Home(), // You might need to adjust this based on your app's logic

  Search(),
  Profile()
];

class BottomNavigation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationProvider);

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
                child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(0),
                  icondata: Icons.home,
                  index: 0,
                  currentIndex: currentIndex, // Pass the current index
                ),
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(1),
                  icondata: Icons.search,
                  index: 1,
                  currentIndex: currentIndex, // Pass the current index
                ),
                NavButton(
                  onTap: () => ref
                      .read(bottomNavigationProvider.notifier)
                      .changeIndex(2),
                  icondata: Icons.person,
                  index: 2,
                  currentIndex: currentIndex, // Pass the current index
                )
              ],
            ),
              )
            ],
          ),
           );
  }
}



// BottomNavigationBar(
//           backgroundColor: black1,
//           currentIndex: currentIndex,
//           onTap: (index) => ref.read(bottomNavigationProvider.notifier).changeIndex(index),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: '',
//             ),
//              BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: '',
//             ),

//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: '',
//             ),
//             // Add other items here
//           ],
//         ),
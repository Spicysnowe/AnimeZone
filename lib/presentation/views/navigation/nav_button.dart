import 'package:anime_zone/core/constants/colors.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    this.onTap,
    this.iconDataActive,
    required this.index,
    required this.currentIndex, this.iconDataInActive,
  });
  final void Function()? onTap;
  final int index;
  final int currentIndex; 
  final IconData? iconDataActive;
  final IconData? iconDataInActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        index == currentIndex ? iconDataActive: iconDataInActive,
        color: grey
      ),
    );
  }
}

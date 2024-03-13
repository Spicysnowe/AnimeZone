import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    this.onTap,
    this.icondata,
    required this.index,
    required this.currentIndex, // Add this
  });
  final void Function()? onTap;
  final int index;
  final int currentIndex; // Add this
  final IconData? icondata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icondata,
        color: index == currentIndex ? Colors.white : Colors.grey,
      ),
    );
  }
}

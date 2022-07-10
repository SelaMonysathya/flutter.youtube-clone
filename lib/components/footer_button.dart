import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  final String text;
  final Widget activeIcon, inactiveIcon;
  final bool isActive;
  final Alignment alignment;
  final VoidCallback onTap;

  const FooterButton({ 
    Key? key, 
    required this.text, 
    required this.activeIcon, 
    required this.inactiveIcon, 
    this.isActive = false, 
    this.alignment = Alignment.centerLeft,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.all(4.0),
      alignment: alignment,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          isActive ? activeIcon : inactiveIcon,
          Text(text, maxLines: 1, style: TextStyle(fontSize: 11),)
        ],
      ),
    );
  }
}
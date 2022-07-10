import 'package:flutter/material.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget leadingIcon;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key, 
    required this.title, 
    required this.leadingIcon, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      textColor: white,
      iconColor: white,
      leading: Container(
        padding: EdgeInsets.all(defaultSPadding),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lightGrey
        ),
        child: leadingIcon
      ),
      title: Text(title),
    );
  }
}
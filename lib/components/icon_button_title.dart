
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class IconButtonTitle extends StatelessWidget {
  final String icon, title;
  final VoidCallback onTap;
  
  const IconButtonTitle({
    Key? key, 
    required this.icon,
    required this.title, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSPadding),
      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minHeight: 60, minWidth: 60),
        icon: Column(
          children: [
            SvgPicture.asset(icon, color: white, height: 30,),
            SizedBox(height: defaultXSPadding,),
            Text(title, style: smallStyle.copyWith(color: white),)
          ],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class AccountListTile extends StatelessWidget {
  final String icon, title;
  final Color? color;
  final bool hasLine;
  
  const AccountListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.color,
    this.hasLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          textColor: white,
          iconColor: white,
          dense: true,
          leading: SvgPicture.asset(icon, color: color,),
          title: Text(title, style: subTitleStyle,),
        ),
        hasLine
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultSPadding),
          child: Divider(thickness: 1.5, color: grey,),
        ) 
        : SizedBox(),
      ],
    );
  }
}
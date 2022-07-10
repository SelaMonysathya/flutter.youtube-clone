
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/themes/color.dart';

List createItems = [
  {
    "icon": SvgPicture.asset("assets/icons/short.svg", color: white,),
    "title" : "Create a short",
  },
  {
    "icon": Icon(LineIcons.upload),
    "title" : "Upload a video",
  },
  {
    "icon": SvgPicture.asset("assets/icons/live.svg", color: white,),
    "title" : "Go live",
  },
];
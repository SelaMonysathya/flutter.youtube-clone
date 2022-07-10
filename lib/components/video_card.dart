import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl, duration, title;
  final String channelProfileUrl, channelName, view, dateTime;
  final VoidCallback onTap;
  
  const VideoCard({
    Key? key, 
    required this.videoUrl, 
    required this.duration,
    required this.title, 
    required this.channelProfileUrl, 
    required this.channelName, 
    required this.view, 
    required this.dateTime,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(videoUrl),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                bottom: defaultSPadding,
                right: defaultSPadding,
                child: Container(
                  padding: EdgeInsets.all(defaultXSPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius / 4),
                    color: black.withOpacity(0.8),
                  ),
                  child: Text(duration, style: smallStyle,),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(defaultSPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(channelProfileUrl),
                ),
                SizedBox(width: defaultSPadding,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(height: 1.5),
                      ),
                      SizedBox(height: defaultXSPadding,),
                      Text(
                        "$channelName • $view views • $dateTime",
                        style: smallStyle.copyWith(color: lightGrey),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: defaultSPadding,),
                Icon(LineIcons.verticalEllipsis, size: 20,),
              ],
            ),
          ),
          SizedBox(height: defaultSPadding,),
        ],
      ),
    );
  }
}
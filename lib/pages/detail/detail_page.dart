import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/components/icon_button_title.dart';
import 'package:youtube_clone/components/video_card.dart';
import 'package:youtube_clone/dummy_data/detail_json.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      videoDetail,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller.initialize().then((value){
      setState(() {
        _controller.setLooping(true);
        _controller.play();
      });
    });
  }

  // _onPauseOrContinue() {
  //   setState(() {
  //     if(_controller.value.isPlaying) {
  //       _controller.pause();
  //     } else {
  //       _controller.play();
  //     }
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildVideoSection(),
          Expanded(
            child: ListView(
              children: [
                _buildInfoSection(),
                SizedBox(height: defaultSPadding,),
                _buildActionSection(),
                SizedBox(height: defaultXSPadding,),
                Divider(thickness: 2, color: grey,),
                _buildChannelSection(),
                Divider(thickness: 2, color: grey,),
                _buildCommentSection(),
                SizedBox(height: defaultLPadding,),
                _buildRelatedVideoSection()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVideoSection() {
    return AspectRatio( 
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Positioned(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context), 
                  splashRadius: 25,
                  icon: Icon(LineIcons.angleLeft, size: 20,)
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {}, 
                        splashRadius: 25,
                        icon: Icon(LineIcons.retweet),
                      ),
                      IconButton(
                        onPressed: () {}, 
                        splashRadius: 25,
                        icon: Icon(Icons.closed_caption_off),
                      ),
                      IconButton(
                        onPressed: () {}, 
                        splashRadius: 25,
                        icon: Icon(LineIcons.cog),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: _onPauseOrContinue,
          //   splashRadius: 25,
          //   iconSize: 35,
          //   icon: _controller.value.isPlaying 
          //   ? SizedBox()
          //   : Pulse(child: Icon(LineIcons.pause)),
          // ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              _controller, 
              allowScrubbing: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: subTitleStyle.copyWith(height: 1.5),
                ),
              ),
              SizedBox(width: defaultSPadding,),
              Icon(LineIcons.angleDown, size: 20,),
            ],
          ),
          SizedBox(height: defaultSPadding,),
          Text(viewerAndDateTime, style: smallStyle,)
        ],
      ),
    );
  }

  Widget _buildActionSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(actionItems.length, (index) {
          return IconButtonTitle(
            onTap: () {},
            icon: actionItems[index]['icon'],
            title: actionItems[index]['title'],
          );
        }),
      ),
    );
  }

  Widget _buildChannelSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultXSPadding),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(channelProfile),
                ),
                SizedBox(width: defaultSPadding,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(channelName, style: subTitleStyle,),
                    SizedBox(height: defaultXSPadding,),
                    Text(channelSubscriber, style: smallStyle,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: defaultSPadding,),
          TextButton(
            onPressed: () {},
            child: Text("subscribe".toUpperCase(), style: subTitleStyle.copyWith(color: primary),)
          ),
        ],
      ),
    );
  }

  Widget _buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Comments"),
                  SizedBox(width: defaultSPadding,),
                  Text(totalComment, style: TextStyle(color: lightGrey),)
                ],
              ),
              Icon(LineIcons.angleDown, size: 16,)
            ],
          ),
          SizedBox(height: defaultPadding,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(userCommentProfile),
              ),
              SizedBox(width: defaultSPadding,),
              Flexible(child: Text(userComment, style: smallStyle.copyWith(color: white),)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedVideoSection() {
    return Column(
      children: List.generate(relatedVideo.length, (index) {
        return VideoCard(
          onTap: () {},
          videoUrl: relatedVideo[index]['videoUrl'],
          duration: relatedVideo[index]['duration'],
          title: relatedVideo[index]['title'],
          channelProfileUrl: relatedVideo[index]['channelProfileUrl'],
          channelName: relatedVideo[index]['channelName'],
          view: relatedVideo[index]['view'],
          dateTime: relatedVideo[index]['dateTime']
        );
      }),
    );
  }
}
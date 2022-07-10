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
    
    _controller = VideoPlayerController.network(
      "https://www.fluttercampus.com/video.mp4",
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller.initialize().then((value){
      setState(() {
        _controller.setLooping(true);
        _controller.play();
      });
    });
    
  }

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
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Best tiktok songs 🍇 Tiktok hits 2022 - Viral songs latest",
                              style: subTitleStyle.copyWith(height: 1.5),
                            ),
                          ),
                          SizedBox(width: defaultSPadding,),
                          Icon(LineIcons.angleDown, size: 20,),
                        ],
                      ),
                      SizedBox(height: defaultSPadding,),
                      Text("2.4M views • 1y ago", style: smallStyle,)
                    ],
                  ),
                ),
                SizedBox(height: defaultSPadding,),
                SingleChildScrollView(
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
                ),
                SizedBox(height: defaultXSPadding,),
                Divider(thickness: 2, color: grey,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultXSPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                            ),
                            SizedBox(width: defaultSPadding,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Deep Chill Mix", style: subTitleStyle,),
                                SizedBox(height: defaultXSPadding,),
                                Text("539K subscribers", style: smallStyle,),
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
                ),
                Divider(thickness: 2, color: grey,),
                Padding(
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
                              Text("351", style: TextStyle(color: lightGrey),)
                            ],
                          ),
                          Icon(LineIcons.angleDown, size: 20,)
                        ],
                      ),
                      SizedBox(height: defaultPadding,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                          ),
                          SizedBox(width: defaultSPadding,),
                          Flexible(child: Text("Just started playlist and I already know it’s going to be a good one 💗☺️", style: smallStyle.copyWith(color: white),)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultLPadding,),
                Column(
                  children: List.generate(5, (index) {
                    return VideoCard(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage())),
                      videoUrl: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c29uZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
                      duration: "16:14",
                      title: "Ed Sheeran, Martin Garrix, Kygo, Dua Lipa, Avicii, Robin Schulz, The Chainsmokers Style - Feeling Me",
                      channelProfileUrl: "https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                      channelName: "Haa Taa Deep",
                      view: "13K",
                      dateTime: "5 months ago",
                    );
                  }),
                )
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
}
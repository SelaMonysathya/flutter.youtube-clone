import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/components/video_card.dart';
import 'package:youtube_clone/dummy_data/home_json.dart';
import 'package:youtube_clone/pages/detail/detail_page.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildCategorySection(),
        _buildVideoSection(),
      ],
    );
  }

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(defaultSPadding),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(defaultXSPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius / 4),
                color: grey,
              ),
              child: Row(
                children: [
                  Icon(LineIcons.compass),
                  SizedBox(width: defaultXSPadding,),
                  Text("Explore")
                ],
              ),
            ),
            SizedBox(width: defaultSPadding,),
            VerticalDivider(thickness: 2, color: grey,),
            SizedBox(width: defaultSPadding,),
            Row(
              children: List.generate(categoryItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: defaultSPadding),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        categoryIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(defaultRadius),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: defaultSPadding - 3, horizontal: defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        border: Border.all(width: 1, color: white.withOpacity(0.1)),
                        color: categoryIndex == index ? white : grey,
                      ),
                      child: Text(
                        categoryItems[index], 
                        style: TextStyle(fontSize: 15, color: categoryIndex == index ? black : white),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

    Widget _buildVideoSection() {
    return Column(
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
    );
  }
}
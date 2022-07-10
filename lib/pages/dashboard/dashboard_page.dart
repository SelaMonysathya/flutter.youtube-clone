import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/components/custom_listtile.dart';
import 'package:youtube_clone/components/footer_button.dart';
import 'package:youtube_clone/dummy_data/dashboard_json.dart';
import 'package:youtube_clone/pages/account/account_page.dart';
import 'package:youtube_clone/pages/home/home_page.dart';
import 'package:youtube_clone/pages/library/library_page.dart';
import 'package:youtube_clone/pages/short/short_page.dart';
import 'package:youtube_clone/pages/subscription/subscription_page.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';
import 'package:youtube_clone/utils/constant.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int tabIndex = 0;

  onChangeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: SvgPicture.asset("assets/icons/logo.svg"),
      actions: [
        IconButton(
          onPressed: () {}, 
          splashRadius: 25,
          icon: Icon(LineIcons.retweet),
        ),
        IconButton(
          onPressed: () {}, 
          splashRadius: 25,
          icon: Icon(LineIcons.bell),
        ),
        IconButton(
          onPressed: () {}, 
          splashRadius: 25,
          icon: Icon(LineIcons.search),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => AccountPage(), 
              fullscreenDialog: true
            ));
          }, 
          splashRadius: 25,
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(profileUrl),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: tabIndex,
      children: [
        HomePage(),
        ShortPage(),
        SubscriptionPage(),
        LibraryPage(),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.only(
        top: defaultSPadding,
        left: defaultPadding,
        right: defaultPadding
      ),
      decoration: BoxDecoration(
        color: dark,
        border: Border(top: BorderSide(width: 1.5, color: grey.withOpacity(0.5))),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ]
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: FooterButton(
                onTap: () => onChangeTab(0),
                isActive: tabIndex == 0,
                activeIcon: SvgPicture.asset("assets/icons/home_active.svg", color: white,),
                inactiveIcon: SvgPicture.asset("assets/icons/home.svg", color: white,),
                text: "Home",
              ),
            ),
            Expanded(
              flex: 2,
              child: FooterButton(
                onTap: () => onChangeTab(1),
                isActive: tabIndex == 1,
                activeIcon: SvgPicture.asset("assets/icons/short_active.svg", color: white,),
                inactiveIcon: SvgPicture.asset("assets/icons/short.svg", color: white,),
                text: "Shorts",
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: onTabCreate,
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.centerLeft,
                icon: SvgPicture.asset("assets/icons/add.svg", color: white, height: 40,),
              )
            ),
            Expanded(
              flex: 2,
              child: FooterButton(
                onTap: () => onChangeTab(2),
                isActive: tabIndex == 2,
                alignment: Alignment.centerRight,
                activeIcon: SvgPicture.asset("assets/icons/subscription_active.svg", color: white,),
                inactiveIcon: SvgPicture.asset("assets/icons/subscription.svg", color: white,),
                text: "Sub",
              ),
            ),
            Expanded(
              flex: 2,
              child: FooterButton(
                onTap: () => onChangeTab(3),
                isActive: tabIndex == 3,
                alignment: Alignment.centerRight,
                activeIcon: SvgPicture.asset("assets/icons/library_active.svg", color: white,),
                inactiveIcon: SvgPicture.asset("assets/icons/library.svg", color: white,),
                text: "Library",
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTabCreate() {
    showModalBottomSheet(
      context: context,
      backgroundColor: dark,
      barrierColor: black.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultRadius)),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: defaultSPadding,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Create", style: titleStyle,),
                    Icon(Icons.close)
                  ],
                ),
              ),
              SizedBox(height: defaultSPadding,),
              Column(
                children: List.generate(createItems.length, (index) {
                  return CustomListTile(
                    onTap: () {},
                    leadingIcon: createItems[index]['icon'],
                    title: createItems[index]['title'],
                  );
                }),
              ),
              SizedBox(height: defaultLPadding,),
            ],
          ),
        );
      });
  }
}
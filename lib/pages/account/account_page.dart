import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:youtube_clone/components/account_listtile.dart';
import 'package:youtube_clone/dummy_data/account_json.dart';
import 'package:youtube_clone/themes/color.dart';
import 'package:youtube_clone/themes/style.dart';
import 'package:youtube_clone/utils/constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: defaultSPadding,),
          ListTile(
            onTap: () {},
            textColor: white,
            iconColor: white,
            dense: true,
            leading: CircleAvatar(backgroundImage: NetworkImage(profileUrl),),
            title: Text(username, style: subTitleStyle,),
            trailing: Icon(LineIcons.angleRight, size: 20),
          ),
          SizedBox(height: defaultPadding,),
          Column(
            children: List.generate(accountItems.length, (index) {
              return AccountListTile(
                icon: accountItems[index]['icon'],
                title: accountItems[index]['title'],
                color: accountItems[index]['color'],
                hasLine: accountItems[index]['hasLine'],
              );
            }),
          ),
          SizedBox(height: defaultLPadding * 2,),
          Text("Privacy Policy • Term of Service", style: smallStyle,)
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class UIConstants {
  static AppBar appbar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitter_icon_path,
        width: 30,
        height: 30,
        color: Colors.amber,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    const Text('Feed Screen'),
    const Text('Search Screen'),
    const Text('Notification Screen'),
  ];
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/assets_constants.dart';
import 'package:twitter/constants/uiconstants.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _page = 0;
  final appbar = UIConstants.appbar();

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: CupertinoTabBar(
        // iconSize: 5,
        currentIndex: _page,
        onTap: onPageChange,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 0
                  ? AssetsConstants.home_filled
                  : AssetsConstants.home_outlined,
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 1
                  ? AssetsConstants.search_filled
                  : AssetsConstants.search_outline,
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _page == 2
                  ? AssetsConstants.bell_filled
                  : AssetsConstants.bell_outline,
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}

import 'package:belyfted_test/home_page.dart';
import 'package:belyfted_test/side_menu.dart';

import 'package:belyfted_test/utils_widgets/app_container.dart';
import 'package:belyfted_test/utils_widgets/assets_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      body: IndexedStack(
        index: currentIndex,
        children: [HomePage(), Scaffold(), Scaffold(), Scaffold()],
      ),
      bottomNavigationBar: AppContainer(
        height: 77,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 10),
        borderRadius: BorderRadius.circular(12),
        color: Color(0xff042656),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              icon: ImageAssets.homeIcon,
              title: "Home",
              isActive: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            BottomNavItem(
              icon: ImageAssets.sendFilledIcon,
              title: "Send",
              isActive: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            BottomNavItem(
              icon: ImageAssets.walletIcon,
              title: "Wallet",
              isActive: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            BottomNavItem(
              icon: ImageAssets.exploreIcon,
              title: "Explore",
              isActive: currentIndex == 3,
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.isActive = false,
  });
  final String icon, title;
  final bool isActive;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
        duration: Duration(milliseconds: 450),
        alignment: Alignment.center,
        width: 76,
        color: isActive ? Color(0x1AE48900) : null,
        border:
            isActive
                ? Border(top: BorderSide(color: Color(0xffF39C12), width: 2))
                : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isActive ? Color(0xffF39C12) : Color(0xffBBBBBB),
                BlendMode.srcIn,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                color: isActive ? Color(0xffF39C12) : Color(0xffBBBBBB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

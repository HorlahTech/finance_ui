import 'package:belyfted_test/utils_widgets/assets_file.dart';
import 'package:belyfted_test/utils_widgets/switch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:belyfted_test/utils_widgets/app_container.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _DrawerHeader(),
            SizedBox(height: 12),
            _DrawerSection(
              title: 'Account',
              items: [
                DrawerItem(
                  icon: ImageAssets.profileIcon,
                  title: 'Your Profile',
                ),
                DrawerItem(
                  icon: ImageAssets.verifyIcon,
                  title: 'Account Verification',
                ),
                DrawerItem(icon: ImageAssets.inboxIcon, title: 'Inbox'),
                DrawerItem(
                  icon: ImageAssets.notificationIcon,
                  title: 'Notifications',
                ),
                DrawerItem(icon: ImageAssets.settingIcon, title: 'Settings'),
              ],
            ),
            _DrawerSection(
              title: 'Finances',
              items: [
                DrawerItem(
                  icon: ImageAssets.transactionLimitIcon,
                  title: 'Transaction Limits',
                ),
                DrawerItem(
                  icon: ImageAssets.tranHistIcon,
                  title: 'Transaction History',
                ),
                DrawerItem(icon: ImageAssets.reipientIcon, title: 'Recipients'),
              ],
            ),
            _DrawerSection(
              title: 'Security',
              items: [
                DrawerItem(
                  icon: ImageAssets.changPasswordIcon,
                  title: 'Change Password',
                ),
                DrawerItem(
                  icon: ImageAssets.loginIcon,
                  title: 'Login Security OTP',
                ),
                DrawerItem(icon: ImageAssets.kycIcon, title: 'KYC'),
                DrawerItem(
                  icon: ImageAssets.fingerprintIcon,
                  title: 'Fingerprint Login',
                  trailing: AppSwitch(),
                ),
                DrawerItem(
                  icon: ImageAssets.twoFactorIcon,
                  title: 'Two Factor Authentication',
                ),
                DrawerItem(
                  icon: ImageAssets.changPasswordIcon,
                  title: 'Change your pin',
                ),
                DrawerItem(
                  icon: ImageAssets.deviceIcon,
                  title: 'Devices and sessions',
                ),
              ],
            ),
            _DrawerSection(
              title: 'Others',
              items: [
                DrawerItem(icon: ImageAssets.helpIcon, title: 'Get help'),

                DrawerItem(icon: ImageAssets.rateIcon, title: 'Our rates'),

                DrawerItem(
                  icon: ImageAssets.languageIcon,
                  title: 'App Language',
                ),

                DrawerItem(
                  icon: ImageAssets.referalsIcon,
                  title: 'Affiliate and Referrals',
                ),
              ],
            ),
            SizedBox(height: 24),
            ListTile(
              visualDensity: VisualDensity(vertical: -4, horizontal: -4),
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(ImageAssets.logoutIcon),
              title: Text('Log out', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Color(0xff042656),
      height: 56,
      borderRadius: BorderRadius.circular(10),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: Image.asset(ImageAssets.personImg).image,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'David Williams',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'davidwilliams@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrawerSection extends StatelessWidget {
  final String title;
  final List<DrawerItem> items;

  const _DrawerSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: RoundedRectangleBorder(side: BorderSide.none),
      shape: RoundedRectangleBorder(side: BorderSide.none),
      initiallyExpanded: true,
      childrenPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      tilePadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color(0xff042656),
        ),
      ),
      children:
          items
              .map(
                (item) => ListTile(
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  leading: SvgPicture.asset(
                    item.icon,
                    // color: Color(0xff042656),
                  ),
                  trailing: item.trailing,
                  title: Text(
                    item.title,

                    style: TextStyle(
                      fontSize: 13,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              )
              .toList(),
    );
  }
}

class DrawerItem {
  String icon, title;
  Widget? trailing;
  DrawerItem({required this.title, required this.icon, this.trailing});
}

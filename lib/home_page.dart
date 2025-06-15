import 'dart:async';

import 'package:belyfted_test/utils_widgets/app_container.dart';
import 'package:belyfted_test/utils_widgets/assets_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Color(0xff042656),
      child: SafeArea(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  Image.asset(ImageAssets.personImg).image,
                            ),
                            onTap: () => Scaffold.of(context).openDrawer(),
                          ),
                          Column(
                            children: [
                              const Text(
                                'Welcome.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Martin Jones',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              AppContainer(
                                height: 36,
                                width: 36,

                                // alignment: Alignment.center,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),

                                child: const Icon(
                                  Icons.notifications,
                                  size: 28,
                                ),
                              ),
                              Positioned(
                                top: -3,
                                right: -3,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.red,
                                  child: const Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).animate().fadeIn().slideY(begin: -0.2),

                      const SizedBox(height: 10),
                      const _BalanceCard().animate().fadeIn().slideX(
                        begin: -0.2,
                      ),
                      const SizedBox(height: 10),
                      ReferalWiget(),
                    ],
                  ),
                ),
                Expanded(child: _RecentTransactions()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ReferalWiget extends StatefulWidget {
  const ReferalWiget({super.key});

  @override
  State<ReferalWiget> createState() => _ReferalWigetState();
}

class _ReferalWigetState extends State<ReferalWiget> {
  late PageController pageController;
  int currentIndex = 0;
  final int initialPage = 1000;

  final List<Widget> items = [
    _ReferCard(
      text:
          "Pay bills & airtime, buy gift cards, \nget latest updates and more...",
      buttonColor: Color(0xffF39C12),
      image: ImageAssets.image1,
      btnText: "Explore",
      btnIcon: ImageAssets.exploreIcon,
    ),
    _ReferCard(
      buttonColor: Color(0xff042656),
      image: ImageAssets.image2,
      btnText: "Refer and Earn",
      text: "Earn \$5 on every referral!",
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: initialPage);
    currentIndex = initialPage;

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (!mounted) return;
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 550),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              final int itemIndex = index % items.length;
              return items[itemIndex].animate().scale().slideX(
                begin: 0.2,
                duration: Duration(milliseconds: 550),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: List.generate(
            items.length,
            (index) => AppContainer(
              width: index == currentIndex % items.length ? 25 : 5,
              height: 5,
              color: Colors.white,
              duration: Duration(milliseconds: 400),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}

class _BalanceCard extends StatefulWidget {
  const _BalanceCard();

  @override
  State<_BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<_BalanceCard>
    with TickerProviderStateMixin {
  late final AnimationController _refreshController;
  late AnimationController _balanceController;
  late Animation<double> _balanceAnimation;
  @override
  void initState() {
    super.initState();
    _refreshController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _balanceController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _balanceAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _balanceController, curve: Curves.easeOut),
    );

    _balanceController.forward();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  final currencies = ["GPB", "USA"];
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 215,

      border: Border.all(width: 1, color: Color(0x40F9F9F9)),
      color: const Color(0x1AFFFFFF),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppContainer(
            height: 132,
            padding: EdgeInsets.all(16),

            color: Color(0xffF39C12),
            borderRadius: BorderRadius.circular(40),

            child: Column(
              children: [
                Row(
                  children: [
                    PopupMenuButton<String>(
                      itemBuilder: (context) {
                        return currencies.map((currency) {
                          return PopupMenuItem(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList();
                      },
                      offset: const Offset(0, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Color(0x1AFFFFFF),
                      child: AppContainer(
                        height: 28,
                        color: Color(0x1AFFFFFF),
                        padding: EdgeInsets.all(3),
                        borderRadius: BorderRadius.circular(25),
                        border: Border(
                          top: BorderSide(color: Color(0x40F9F9F9)),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(ImageAssets.flagImg),
                              radius: 12,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'GBP',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),
                    SvgPicture.asset(ImageAssets.eyeVisibilityIcon),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Total balance',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                AnimatedBuilder(
                  animation: _balanceController,
                  builder: (context, _) {
                    return RichText(
                      key: ValueKey(_balanceAnimation.value),
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '£${_balanceAnimation.value.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF001437), // Dark navy
                            ),
                          ),
                          TextSpan(
                            text: '.00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700], // Soft grey
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _ActionButton(
                  icon: ImageAssets.sendOutlineIcon,
                  label: 'Send',
                  width: 197,
                ),
                const _ActionButton(icon: ImageAssets.addIcon, label: ''),

                RotationTransition(
                  turns: Animation.fromValueListenable(_refreshController),
                  child: _ActionButton(
                    ontap: () {
                      _refreshController.forward(from: 0);
                    },
                    icon: ImageAssets.refreshIcon,
                    label: '',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final double width;
  final VoidCallback? ontap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.width = 50,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(30),
      // splashColor: Colors.blueGrey,
      child: AppContainer(
        padding: EdgeInsets.all(8),
        width: width,
        height: 50,
        color: Color(0xff345076),
        borderRadius: BorderRadius.circular(40),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReferCard extends StatelessWidget {
  const _ReferCard({
    required this.buttonColor,
    required this.text,
    required this.btnText,
    this.btnIcon,
    required this.image,
  });
  final Color buttonColor;
  final String text;
  final String btnText;
  final String? btnIcon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:
                      btnIcon == null
                          ? Text(
                            btnText,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                          : Row(
                            children: [
                              SvgPicture.asset(
                                btnIcon!,
                                colorFilter: ColorFilter.mode(
                                  Color(0xff042656),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                btnText,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff042656),
                                ),
                              ),
                            ],
                          ),
                ),

                Text(
                  text,
                  maxLines: 2,

                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff5A5A5A),
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(image)),
        ],
      ),
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  _RecentTransactions();
  final transactions = [
    {
      "name": "Miracle Sahid",
      "type": "Transfer",
      "date": "Apr 26 2023",
      "amount": "-₦94,249.00",
    },
    {
      "name": "GBP to NGN",
      "type": "Convert",
      "date": "Apr 15 2023",
      "amount": "£104.00",
    },
    {
      "name": "Samuel Abram",
      "type": "GBP Wallet funding",
      "date": "Apr 08 2023",
      "amount": "+£104.00",
    },
    {
      "name": "Samuel Abram",
      "type": "GBP Wallet funding",
      "date": "Apr 08 2023",
      "amount": "+£104.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "View all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return _TransactionItem(
                      title: transactions[index]["name"] ?? '',
                      type: transactions[index]["type"] ?? '',
                      date: transactions[index]["date"] ?? '',
                      amount: transactions[index]["amount"] ?? '',
                    )
                    .animate()
                    .fadeIn(duration: Duration(milliseconds: 400))
                    .slideX(
                      delay: Duration(milliseconds: index * 100),
                      begin: -0.4,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title, type, date, amount;

  const _TransactionItem({
    required this.title,
    required this.type,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(vertical: -4),
      leading: CircleAvatar(
        backgroundColor:
            type == "Convert" ? Color(0xffF9EAE9) : Color(0xffE6E9EE),
        radius: 20,
        child: SvgPicture.asset(
          type == "Convert"
              ? ImageAssets.convertIcon
              : type == "Transfer"
              ? ImageAssets.sendOutlineIcon
              : ImageAssets.fundingIcon,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        '$type  •  $date',
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }
}

import 'package:alarm_app/utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalVar>(context);

    void onItemTapped(int index) {
      setState(() {
        global.setIndex(index);
      });
    }

    return BottomNavigationBar(
      currentIndex: global.getIndex,
      selectedItemColor: const Color(0xff3AD277),
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Noto_Sans_KR',
        fontWeight: FontWeight.w600,
        fontSize: 10,
      ),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      onTap: onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: SvgPicture.asset(
              'assets/images/svg/alarm_list_icon.svg',
              width: 28,
              height: 28,
              color: global.getIndex == 0 ? const Color(0xff3AD277) : null,
            ),
          ),
          label: '알람 목록',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: SvgPicture.asset(
              'assets/images/svg/friends_icon.svg',
              width: 28,
              height: 28,
              color: global.getIndex == 1 ? const Color(0xff3AD277) : null,
            ),
          ),
          label: '친구',
        ),
        // BottomNavigationBarItem(
        //   icon: Padding(
        //     padding: const EdgeInsets.only(bottom: 3.0),
        //     child: SvgPicture.asset(
        //       'assets/images/svg/history_icon.svg',
        //       width: 28,
        //       height: 28,
        //       color: global.getIndex == 2 ? const Color(0xff3AD277) : null,
        //     ),
        //   ),
        //   label: '기록',
        // ),
      ],
    );
  }
}

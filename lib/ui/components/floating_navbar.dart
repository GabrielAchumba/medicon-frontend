import 'dart:convert';

//import 'package:cafia/locator.dart';
import 'package:flutter/material.dart';
import 'package:medicon/ui/utils/colors.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//import '../pages/auth/signup3_view.dart';
import '../../local_storage.dart';
import '../utils/router.dart';
import 'text_widgets.dart';
import 'package:http/http.dart' as http;

class FloatingNavBar extends StatefulWidget {
  final List<FloatingNavBarItem> items;

  const FloatingNavBar({super.key, required this.items});

  @override
  _FloatingNavBarState createState() {
    return _FloatingNavBarState();
  }
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  PageController bottomNavbarController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: bottomNavbarController,
              children: widget.items.map((item) => item.page).toList(),
              onPageChanged: (index) => _changePage(index),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 30.h,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.h),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(.4),
                        blurRadius: 10,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgetsBuilder(widget.items),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingNavBarItem(FloatingNavBarItem item, int index) {
    return FutureBuilder(
      future: Future.value(true),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _changePage(index),
              child: SizedBox(
                height: 60.h,
                width: 45.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (currentIndex == index && currentIndex != 2)
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 2.h,
                          width: 30.h,
                          decoration:
                              const BoxDecoration(color: AppColors.green),
                        ),
                      ),
                    item.img == 'main-add'
                        ? Image.asset(
                            'assets/images/main-add.png',
                            height: 45.h,
                            width: 45.h,
                          )
                        : item.img == "message"
                            ? Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/message${currentIndex != index ? '0' : '1'}.png',
                                    height: 26.h,
                                    width: 26.h,
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        '4',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Image.asset(
                                'assets/images/${item.img}${currentIndex != index ? '0' : '1'}.png',
                                height: 24.h,
                                width: 24.h,
                              ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _widgetsBuilder(List<FloatingNavBarItem> items) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = _floatingNavBarItem(items[i], i);
      _floatingNavBarItems.add(item);
    }
    return _floatingNavBarItems;
  }

  _changePage(index) async {

    //For now no Modal
    /* if (index == 2) {
      showBarModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.transparent,
        topControl: const SizedBox(),
        builder: (context) => widget.items[index].page,
      );
      return;
    } */
    currentIndex = index;
    bottomNavbarController.jumpToPage(index);
    setState(() {});
  }
}

void moveUp(ScrollController control) {
  if (control.hasClients) {
    control.animateTo(control.position.minScrollExtent - 60,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 500));
  }
}

class FloatingNavBarItem {
  String img;
  Widget page;

  FloatingNavBarItem({required this.img, required this.page});
}
import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/utils.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, 
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.removeBack = false,
    this.removeImage = false,
  });

  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool removeBack;
  final bool removeImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.offKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.lemon,
        extendBodyBehindAppBar: true,
        appBar: title == null
            ? null
            : AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: removeBack
                    ? null
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              print(context);
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                iconTheme: const IconThemeData(color: AppColors.black),
                title: regularText(
                  title!,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                ),
              ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: removeImage
                ? null
                : const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
            child:  SafeArea(child: child)) ,   
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
      ),
    );
  }
}

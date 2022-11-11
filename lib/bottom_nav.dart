import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeeshan_exam/utils/color_helper.dart';
import 'package:zeeshan_exam/utils/image_helper.dart';
import 'package:zeeshan_exam/views/category_view.dart';
import 'package:zeeshan_exam/views/home_view.dart';
import 'package:zeeshan_exam/views/trends_view.dart';
import 'package:zeeshan_exam/widgets/bottom_item.dart';

import 'controller/bottom_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Obx((){
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorHelper.white,
          appBar: AppBar(
            backgroundColor: ColorHelper.white,
            elevation: 3.0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            flexibleSpace: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        specialIcon(ImageHelper.filter),
                        const SizedBox(width: 10,),
                        specialIcon(ImageHelper.search),
                      ],
                    ),
                    SvgPicture.asset(
                      ImageHelper.titleLogo,
                    ),
                    Row(
                      children: [
                        specialIcon(ImageHelper.notification),
                        const SizedBox(width: 10,),
                        specialIcon(ImageHelper.buy),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: PageView(
            onPageChanged: (value)
            {
              bottomNavBarController.currentIndex.value = value;
              bottomNavBarController.update();
            },
            physics: const NeverScrollableScrollPhysics(),
            controller: bottomNavBarController.pageController,
            children: const [
              HomeView(),
              CategoryView(),
              TrendView(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorHelper.white,
              boxShadow: [
                BoxShadow(
                  color: ColorHelper.black.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomItem(
                    iconLink: ImageHelper.homeIcon,
                    text: 'Home',
                    isSelected: bottomNavBarController.currentIndex.value == 0,
                    onTap: () {
                      bottomNavBarController.currentIndex.value = 0;
                      setState(() {
                        bottomNavBarController.pageController.jumpToPage(0);
                      });
                    },
                  ),
                  BottomItem(
                    iconLink: ImageHelper.categoryIcon,
                    text: 'Category',
                    isSelected: bottomNavBarController.currentIndex.value == 1,
                    onTap: () {
                      bottomNavBarController.currentIndex.value = 1;
                      setState(() {
                        bottomNavBarController.pageController.jumpToPage(1);
                      });
                    },
                  ),
                  BottomItem(
                    iconLink: ImageHelper.trendIcon,
                    text: 'Trends',
                    isSelected: bottomNavBarController.currentIndex.value == 2,
                    onTap: () {
                      bottomNavBarController.currentIndex.value = 2;
                      setState(() {
                        bottomNavBarController.pageController.jumpToPage(2);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }


  Widget specialIcon(String link){
    return SvgPicture.asset(
      link,
      height: 27,
      width: 27,
      fit: BoxFit.fill,
    );
  }
}

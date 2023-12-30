import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/myapp/screens/home/home.dart';
import 'package:t_store/features/myapp/screens/lab/lab_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              backgroundColor: dark ? TColors.black : TColors.white,
              indicatorColor: dark
                  ? TColors.white.withOpacity(0.1)
                  : TColors.black.withOpacity(0.1),
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Iconsax.book_1),
                  label: 'Education',
                  tooltip: '',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.people),
                  label: 'Community',
                  tooltip: '',
                ),
                NavigationDestination(
                    icon: Icon(Iconsax.home), label: 'Home', tooltip: ''),
                NavigationDestination(
                  icon: Icon(Iconsax.search_favorite_1),
                  label: 'Discovery',
                  tooltip: '',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user),
                  label: 'Profile',
                  tooltip: '',
                ),
              ]),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;

  final screens = [
    Container(
      color: Colors.deepPurple,
    ),
    const MyLabScreen(),
    HomeScreen(),
    Container(color: Colors.orange),
    Container(color: Colors.amber),
  ];
}

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// if you want to add the background color to tabs you have to wrap them in Material widget.
  /// To do that we need [PrefferedSized] Widget and that's why created custom class.
  const TTabBar(
      {super.key, required this.tabs, this.padding, this.isScrollable = true});

  final List<Widget> tabs;
  final EdgeInsetsGeometry? padding;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        padding: padding,
        tabAlignment: TabAlignment.center,
        tabs: tabs,
        isScrollable: isScrollable,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

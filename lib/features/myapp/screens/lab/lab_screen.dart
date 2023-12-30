import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/proteins/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/calculation_main.dart';
import 'package:t_store/common/widgets/calender/lab_calender.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size_constant.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class MyLabScreen extends StatelessWidget {
  const MyLabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    //final width = THelperFunctions.screenWidth();

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: TAppBar(
            title: Text(
              "MyLab",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              TCardCountericon(
                onPressed: () {},
                backgroundColor: dark ? TColors.dark : TColors.light,
                iconColor: dark ? TColors.white : TColors.black,
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? TColors.black : TColors.white,
                    expandedHeight: 570,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// -- Search Bar
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          /*TSearchContainer(
                        text: 'text',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),*/

                          ///-- Featured Calender,
                          TConstrainedWidth(
                            maxWidth: 450,
                            child: TSectionHeading(
                              title: 'My Calender',
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              showActionButton: true,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),
                          const LabCalender(),
                        ],
                      ),
                    ),
                    bottom: const TTabBar(tabs: [
                      Tab(child: Text('Buffers')),
                      Tab(child: Text('Time Tools')),
                      Tab(child: Text('Stock Info')),
                      Tab(child: Text('Protocols')),
                      Tab(child: Text('Calibration'))
                    ]))
              ];
            },
            body: TabBarView(
              children: [
                const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 60,
                        right: TSizes.spaceBtwItems,
                        left: TSizes.spaceBtwItems,
                        bottom: TSizes.defaultSpace),

                    /// Buffer Create
                    child: Column(
                      children: [
                        TConstrainedWidth(
                          maxWidth: 600,
                          child: TRoundedContainer(
                            showBorder: true,
                            borderColor: TColors.primary,
                            backgroundColor: null,
                            child: Padding(
                                padding: EdgeInsets.all(TSizes.smd),
                                child: BufferCalculation()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child:
                      Container(width: 200, height: 200, color: Colors.yellow),
                ),
                SingleChildScrollView(
                  child:
                      Container(width: 200, height: 200, color: Colors.green),
                ),
                SingleChildScrollView(
                  child: Container(width: 200, height: 200, color: Colors.red),
                ),
                SingleChildScrollView(
                  child:
                      Container(width: 200, height: 200, color: Colors.purple),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';

import 'package:t_store/utils/constants/size_constant.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
    required this.titles,
    required this.images,
    this.padding = 26,
    this.maxWidth = 1000,
  });

  final List<String> titles;
  final List<String> images;

  final double padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return TConstrainedWidth(
      maxWidth: maxWidth,
      child: Padding(
        padding: EdgeInsets.only(left: padding),
        child: SizedBox(
          height: 104,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: titles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final int titleIndex = index % titles.length;
              final int imageIndex = index % images.length;

              return TVerticalImageText(
                image: images[imageIndex],
                title: titles[titleIndex],
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}

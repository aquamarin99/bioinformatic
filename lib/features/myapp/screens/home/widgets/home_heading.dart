import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/utils/constants/size_constant.dart';

class THomeHeading extends StatelessWidget {
  const THomeHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TConstrainedWidth(
      maxWidth: 450,
      child: TSectionHeading(
        title: 'Articles of the Day',
        showActionButton: false,
        textColor: Colors.white,
      ),
    );
  }
}

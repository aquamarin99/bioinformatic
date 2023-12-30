import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CalculationBufferTextFormField extends StatelessWidget {
  CalculationBufferTextFormField({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    List<TextInputFormatter>? inputFormatters,
  })  : _controller = controller,
        _inputFormatters = inputFormatters ?? [];

  final double maxWidth = 600;
  final TextEditingController _controller;
  final double width = THelperFunctions.screenWidth();
  final String labelText;
  final List<TextInputFormatter> _inputFormatters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: maxWidth > width
            ? (width * 6.5 / 10) - 30
            : (maxWidth * 6.5 / 10) - 30,
        height: 40,

        /// Text Form Field Kullanıcı Girdileri
        child: TextFormField(
          controller: _controller,
          inputFormatters: _inputFormatters,
          cursorHeight: 24,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.darkGrey, fontSizeFactor: 1.2),
          ),
        ));
  }
}

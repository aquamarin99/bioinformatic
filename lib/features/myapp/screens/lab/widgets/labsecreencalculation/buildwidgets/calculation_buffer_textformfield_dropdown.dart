import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_buffer_textformfield.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/create_buffer_dropdown_button.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CreateBufferTextFormFieldDropdown extends StatelessWidget {
  CreateBufferTextFormFieldDropdown({
    super.key,
    required TextEditingController controller,
    required this.unitValues,
    required this.labelText,
    required this.initialSelectedValue,
    required this.onSelectionChanged,
    this.dropDownButton = true,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final List<String> unitValues;
  final String initialSelectedValue;
  final dynamic Function(String) onSelectionChanged;
  final bool dropDownButton;
  final double maxWidth = 600;
  final double width = THelperFunctions.screenWidth();

  @override
  Widget build(BuildContext context) {
    if (dropDownButton) {
      return Padding(
        padding: const EdgeInsets.only(right: TSizes.sm, left: TSizes.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalculationBufferTextFormField(
              controller: _controller,
              labelText: labelText,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d*$'),
                ),
              ],
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            SizedBox(
              width: 85,
              child: MyDropDownButton(
                unitValues: unitValues,
                initialSelectedValue: initialSelectedValue,
                onSelectionChanged: onSelectionChanged,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: TSizes.sm, left: TSizes.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: maxWidth > width
                  ? (width * 6.5 / 10) + 55
                  : (maxWidth * 6.5 / 10) + 55,
              height: 40,
              child: CalculationBufferTextFormField(
                controller: _controller,
                labelText: labelText,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*$'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            // İstediğiniz başka bir widget veya boş bir container ekleyebilirsiniz.
          ],
        ),
      );
    }
  }
}

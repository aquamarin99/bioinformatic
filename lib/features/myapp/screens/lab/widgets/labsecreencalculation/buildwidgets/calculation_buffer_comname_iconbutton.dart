import 'package:flutter/material.dart';
import 'package:t_store/features/myapp/screens/lab/widgets/labsecreencalculation/buildwidgets/calculation_buffer_textformfield.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CreateBufferComNameIconButton extends StatelessWidget {
  const CreateBufferComNameIconButton({
    super.key,
    required TextEditingController compoundNameController,
    required this.labelText,
    this.onPressed,
  }) : _compoundNameController = compoundNameController;

  final TextEditingController _compoundNameController;
  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: TSizes.sm,
        left: TSizes.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalculationBufferTextFormField(
            controller: _compoundNameController,
            labelText: labelText,
          ),
          const SizedBox(
            width: TSizes.sm,
          ),
          SizedBox(
            width: 85,
            child: IconButton(
              /// onPressed Function
              onPressed: onPressed,
              icon: const Icon(
                Icons.add,
              ),
              color: TColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

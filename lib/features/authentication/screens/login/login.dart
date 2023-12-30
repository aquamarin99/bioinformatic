import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/size_constant.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: TSpacingStyle.paddingWithAppBarHeight,
      child: TConstrainedWidth(
        maxWidth: 600,
        child: Column(children: [
          ///pixelNumberCalculartor,
          ///Text(currentWidth.toString()),

          ///Logo, Title & Sub-Title,
          const TLoginHeader(),

          /// Form,
          const TLoginForm(),

          ///Divider,
          TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
          const SizedBox(
            height: TSizes.spaceBtwSections / 2,
          ),

          ///Footer,
          const TSocialButtons(),
        ]),
      ),
    ));
  }
}

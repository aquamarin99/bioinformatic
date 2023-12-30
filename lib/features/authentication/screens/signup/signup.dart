import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size_constant.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark
              ? TColors.primary
              : TColors.black, //change your color here ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TConstrainedWidth(
          maxWidth: 600,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///Tilte,
            Text(TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Form,
            const TSignupForm(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Divider,
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Footer,
            const TSocialButtons(),
          ]),
        ),
      ),
    );
  }
}

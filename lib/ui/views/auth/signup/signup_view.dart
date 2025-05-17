import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_strings.dart';
import '../../../common/constants/helper_functions.dart';
import '../../../common/constants/ui_helpers.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new),
          title: text_helper(data: "Forget Password"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(padding10),
            child: ListView(
              children: [
                text_helper(
                  data: "Let's Find A Doctor",
                  fontWeight: FontWeight.bold,
                  size: fontSize20,
                ).animate(delay: 500.ms).fade().moveY(begin: 100, end: 0),
                viewModel.verify
                    ? Column(
                        children: [
                          text_helper(
                            data: "Verify Email",
                            color: isDarkMode(context) ? grey : darkGrey,
                          )
                              .animate(delay: 300.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          text_helper(
                            data:
                                "Please Verify your email and Login to continue",
                            color: isDarkMode(context) ? grey : darkGrey,
                          )
                              .animate(delay: 500.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          verticalSpaceMedium,
                          button_helper(
                                  onpress: () => viewModel.login(),
                                  width: screenWidth(context),
                                  child: text_helper(
                                    data: "Click here to login",
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                    size: fontSize16,
                                  ))
                              .animate(delay: 700.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                        ],
                      )
                    : Column(
                        children: [
                          text_helper(
                            data: "Sign up to continue",
                            color: isDarkMode(context) ? grey : darkGrey,
                          )
                              .animate(delay: 700.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          verticalSpaceLarge,
                          viewModel.image == null
                              ? InkWell(
                                  onTap: () => viewModel.profilepic(),
                                  child: const Icon(
                                    Iconsax.profile_add,
                                    size: 80,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => viewModel.profilepic(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      viewModel.image!,
                                      fit: BoxFit.cover,
                                      height: screenWidthCustom(context, 0.3),
                                      width: screenWidthCustom(context, 0.3),
                                    ),
                                  ),
                                ),
                          verticalSpaceLarge,
                          text_view_helper(
                            hint: "Enter Email",
                            controller: viewModel.email,
                            prefix: const Icon(Icons.mail_outline),
                          )
                              .animate(delay: 900.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          text_view_helper(
                                  prefix: const Icon(Iconsax.profile_add),
                                  hint: "Enter Your Name",
                                  controller: viewModel.name)
                              .animate(delay: 900.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          text_view_helper(
                                  prefix: const Icon(Iconsax.call),
                                  hint: "Enter Your Number",
                                  maxlength: 12,
                                  textInputType: TextInputType.number,
                                  controller: viewModel.number)
                              .animate(delay: 900.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          text_view_helper(
                            hint: "Enter Password",
                            controller: viewModel.password,
                            obsecure: viewModel.obsure,
                            maxline: 1,
                            suffix: InkWell(
                              onTap: () => viewModel.toggle(),
                              child: Icon(viewModel.obsure
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                            ),
                            prefix: const Icon(Iconsax.password_check),
                          )
                              .animate(delay: 1100.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          Padding(
                            padding: const EdgeInsets.all(padding10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text_helper(
                                    data: "Select a Category"),
                                DropdownButton<String>(
                                  hint: text_helper(
                                      data: "Select a Category"),
                                  value: viewModel.cat,
                                  onChanged: (String? newValue) =>
                                      viewModel.updateCat(newValue!),
                                  items: viewModel.categories
                                      .map<DropdownMenuItem<String>>(
                                          (String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                ),
                              ],
                            )
                                .animate(delay: 1300.ms)
                                .fade()
                                .moveY(begin: 100, end: 0),
                          ),
                          button_helper(
                                  onpress: () => viewModel.signup(context),
                                  width: screenWidth(context),
                                  child: text_helper(
                                    data: "Signup",
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                    size: fontSize16,
                                  ))
                              .animate(delay: 1500.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                          InkWell(
                                  onTap: () => viewModel.login(),
                                  child: text_helper(
                                      data: "Already Have Account",
                                  ))
                              .animate(delay: 1700.ms)
                              .fade()
                              .moveY(begin: 100, end: 0),
                        ],
                      ),
              ],
            ),
          ),
        ));
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}

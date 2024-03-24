import 'package:user_profile/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/core/app_export.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildFive(context),
                  SizedBox(height: 54.v),
                  Container(
                      height: 140.v,
                      width: 150.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      decoration: AppDecoration.outlineWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder70),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgVector,
                          height: 117.v,
                          width: 100.h,
                          alignment: Alignment.bottomCenter)),
                  SizedBox(height: 21.v),
                  CustomElevatedButton(width: 109.h, text: "100 Points"),
                  SizedBox(height: 23.v),
                  SizedBox(
                      width: 176.h,
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Name\n",
                                style: CustomTextStyles.titleLargeffffffff),
                            TextSpan(
                                text: "Ridma Palansuriya\n",
                                style: theme.textTheme.titleLarge),
                            TextSpan(
                                text: "\nEmail Address\n",
                                style: CustomTextStyles.titleLargeffffffff),
                            TextSpan(
                                text: "ridma@gmal.com\n",
                                style: theme.textTheme.titleLarge),
                            TextSpan(
                                text: "\nPhone Number:\n",
                                style: CustomTextStyles.titleLargeffffffff),
                            TextSpan(
                                text: "0769173010",
                                style: theme.textTheme.titleLarge)
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 23.v),
                  CustomElevatedButton(
                      height: 36.v,
                      width: 149.h,
                      text: "Logout",
                      buttonStyle: CustomButtonStyles.fillBlueGrayTL18,
                      buttonTextStyle:
                          CustomTextStyles.titleLargeInterBlack900),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return SizedBox(
        height: 112.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topLeft, children: [
          ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

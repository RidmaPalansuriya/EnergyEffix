import 'package:flutter/material.dart';
import 'package:user_profile/core/app_export.dart';
import 'package:user_profile/widgets/custom_elevated_button.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController _nameController = TextEditingController(text: "Chamodi Hansani");
  TextEditingController _emailController = TextEditingController(text: "chamodi@gmail.com");
  TextEditingController _phoneController = TextEditingController(text: "0769473010");

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildFive(context),
                  SizedBox(height: 54.v),
                  Container(
                    height: 140.v,
                    width: 150.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    decoration: AppDecoration.outlineWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder70,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 117.v,
                      width: 100.h,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  SizedBox(height: 21.v),
                  CustomElevatedButton(width: 109.h, text: "100 Points"),
                  SizedBox(height: 23.v),
                  SizedBox(
                    width: 176.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTextField("Name", _nameController, theme),
                        SizedBox(height: 23.v),
                        _buildTextField("Email Address", _emailController, theme),
                        SizedBox(height: 23.v),
                        _buildTextField("Phone Number", _phoneController, theme),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.v),
                  CustomElevatedButton(
                    height: 36.v,
                    width: 149.h,
                    text: "Logout",
                    buttonStyle: CustomButtonStyles.fillBlueGrayTL18,
                    buttonTextStyle: CustomTextStyles.titleLargeInterBlack900,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return SizedBox(
      height: 112.v,
      width: double.maxFinite,
      child: Stack(alignment: Alignment.topLeft, children: []),
    );
  }

  /// Builds a text field with given label and controller.
  Widget _buildTextField(String label, TextEditingController controller, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomTextStyles.titleLargeffffffff,
        ),
        TextField(
          controller: controller,
          style: theme.textTheme.titleLarge,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          ),
        ),
      ],
    );
  }
}

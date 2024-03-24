import 'package:flutter/material.dart';
import 'package:add_property/core/app_export.dart';

void main() {
  // Apply the custom theme to the entire app
  runApp(MaterialApp(
    theme: ThemeData(
      // Set the highlightColor to transparent to remove the yellow overlay
      highlightColor: Colors.transparent,
      // Set the splashColor and focusColor to transparent to remove the yellow overlay when keyboard pops up
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
    ),
    home: MyProfileScreen(),
  ));
}

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTwo(context),
              SizedBox(height: 33.v),
              Text(
                "Analytics",
                textAlign: TextAlign.right,
                style: theme.textTheme.titleLarge,
              ),
              Spacer(flex: 39),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Smart Meter",
                  style: theme.textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 74.v),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 223.h,
                  child: Column(
                    children: [
                      _buildHeading("Serial Number"),
                      SizedBox(height: 8.v),
                      _buildTextField("DGTY-456-1563"),
                      SizedBox(height: 16.v),
                      _buildHeading("Meter ID"),
                      SizedBox(height: 8.v),
                      _buildTextField("125-566-3583"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.v),
              Padding(
                padding: EdgeInsets.only(left: 47.h, right: 67.h),
                child: Row(
                  children: [
                    Container(
                      height: 34.v,
                      width: 28.h,
                      decoration: AppDecoration.fillGray800.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder1,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgCheckmark,
                        height: 34.v,
                        width: 28.h,
                        radius: BorderRadius.circular(1.h),
                        alignment: Alignment.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.h, top: 9.v, bottom: 5.v),
                      child: Text(
                        "Allow access to the Smart Meter",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 31.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 100, // Adjust width here
                        child: Container(
                          height: 23.v,
                          width: 24.h,
                          margin: EdgeInsets.only(top: 4.v, bottom: 2.v),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgCheckmarkGray800,
                                height: 14.adaptSize,
                                width: 14.adaptSize,
                                alignment: Alignment.center,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgUnion,
                                height: 23.v,
                                width: 24.h,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 19.h, top: 1.v),
                        child: Text(
                          "Add Device",
                          style: CustomTextStyles.headlineSmallAbhayaLibreExtraBoldBlack900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 60),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 36.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgClose,
            height: 20.v,
            width: 32.h,
            radius: BorderRadius.circular(10.h),
            onTap: () {
              onTapImgClose(context);
            },
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 8.v,
            width: 94.h,
            radius: BorderRadius.circular(4.h),
            margin: EdgeInsets.only(bottom: 11.v),
          ),
        ],
      ),
    );
  }

  /// Builds a heading for serial number and meter ID
  Widget _buildHeading(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white, // Set color to white
        fontSize: 18, // Set font size
        fontWeight: FontWeight.bold, // Set font weight
      ),
    );
  }

  /// Builds a text field for serial number and meter ID
  Widget _buildTextField(String initialValue) {
    return TextFormField(
      initialValue: initialValue,
      style: TextStyle(color: Colors.black), // Set text color to black
      cursorColor: Colors.black, // Set cursor color to black
      decoration: InputDecoration(
        labelText: '', // Empty string to remove the label
        fillColor: Colors.white, // Set fill color to white
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // Remove border side
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent), // Remove focus border
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }
}

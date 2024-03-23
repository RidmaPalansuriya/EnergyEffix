import 'package:mybill/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:mybill/core/app_export.dart';

class MyBillScreen extends StatelessWidget {
  const MyBillScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 21.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 59.v),
              Container(
                margin: EdgeInsets.only(left: 14.h),
                decoration: AppDecoration.outlineBlack,
                child: Text(
                  "BillGenius",
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 5.v),
              Container(
                margin: EdgeInsets.only(left: 17.h),
                decoration: AppDecoration.outlineBlack,
                child: Text(
                  "29 July, 2023",
                  style: CustomTextStyles.titleLargeABeeZee,
                ),
              ),
              SizedBox(height: 1.v),
              Container(
                width: 332.h,
                margin: EdgeInsets.only(left: 14.h),
                decoration: AppDecoration.outlineBlack,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " \n",
                        style: CustomTextStyles
                            .titleLargeAbhayaLibreExtraBoldffffffff,
                      ),
                      TextSpan(
                        text: "Connection Details\n",
                        style: CustomTextStyles.titleMediumffffffff,
                      ),
                      TextSpan(
                        text: "\n",
                        style: theme.textTheme.titleMedium!.copyWith(
                          height: 1.07,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Customer Name: Aruna Fernando\n\nConnection Number: XX-XXX-XX-XXXX\n",
                        style: theme.textTheme.labelLarge!.copyWith(
                          height: 1.07,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 53.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Subscription Details",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 24.v),
              Container(
                width: 84.h,
                margin: EdgeInsets.only(left: 24.h),
                child: Text(
                  "Date :\n\nAmount :",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    height: 1.07,
                  ),
                ),
              ),
              SizedBox(height: 53.v),
              CustomElevatedButton(
                width: 206.h,
                text: "Pay Bill Online",
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

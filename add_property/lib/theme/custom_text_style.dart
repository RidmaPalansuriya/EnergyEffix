import 'package:flutter/material.dart';
import 'package:add_property/core/utils/size_utils.dart';
import 'package:add_property/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineLargeff19b6d6 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF19B6D6),
      );
  static get headlineSmallAbhayaLibreExtraBoldBlack900 =>
      theme.textTheme.headlineSmall!.abhayaLibreExtraBold.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );
  // Title text style
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get abhayaLibreExtraBold {
    return copyWith(
      fontFamily: 'Abhaya Libre ExtraBold',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get erasBoldITC {
    return copyWith(
      fontFamily: 'Eras Bold ITC',
    );
  }

  TextStyle get abrilFatface {
    return copyWith(
      fontFamily: 'Abril Fatface',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mybill/core/utils/size_utils.dart';
import 'package:mybill/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title style
  static get titleLargeABeeZee => theme.textTheme.titleLarge!.aBeeZee;
  static get titleLargeAbhayaLibreExtraBoldffffffff =>
      theme.textTheme.titleLarge!.abhayaLibreExtraBold.copyWith(
        color: Color(0XFFFFFFFF),
        fontWeight: FontWeight.w800,
      );
  static get titleLargeRobotoSerifBlack90001 =>
      theme.textTheme.titleLarge!.robotoSerif.copyWith(
        color: appTheme.black90001,
      );
  static get titleMediumffffffff => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFFFFFFFF),
      );
}

extension on TextStyle {
  TextStyle get aBeeZee {
    return copyWith(
      fontFamily: 'ABeeZee',
    );
  }

  TextStyle get abhayaLibreExtraBold {
    return copyWith(
      fontFamily: 'Abhaya Libre ExtraBold',
    );
  }

  TextStyle get robotoSerif {
    return copyWith(
      fontFamily: 'Roboto Serif',
    );
  }

  TextStyle get abrilFatface {
    return copyWith(
      fontFamily: 'Abril Fatface',
    );
  }
}

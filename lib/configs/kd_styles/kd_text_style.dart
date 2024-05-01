part of 'app_styles.dart';

class KdTextStyles {
  static TextStyle get _googleFontMontserrat =>
      GoogleFonts.montserrat().copyWith(color: KdColor.neutral90);

  static TextStyle get _googleFontRoboto =>
      GoogleFonts.roboto().copyWith(color: KdColor.neutral90);

  static TextStyle get _headingBold =>
      _googleFontMontserrat.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get _headingSemiBold =>
      _googleFontMontserrat.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get _headingMedium =>
      _googleFontMontserrat.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get _headingRegular =>
      _googleFontMontserrat.copyWith(fontWeight: FontWeight.w400);

  static TextStyle get _paragraphBold =>
      _googleFontRoboto.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get _paragraphMedium =>
      _googleFontRoboto.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get _paragraphRegular =>
      _googleFontRoboto.copyWith(fontWeight: FontWeight.w400);

  static TextStyle heading1Bold = _headingBold.copyWith(fontSize: 60);
  static TextStyle heading2Bold = _headingBold.copyWith(fontSize: 48);
  static TextStyle heading3Bold = _headingBold.copyWith(fontSize: 34);
  static TextStyle heading4Bold = _headingBold.copyWith(fontSize: 24);
  static TextStyle heading5Bold = _headingBold.copyWith(fontSize: 20);
  static TextStyle heading6Bold = _headingBold.copyWith(fontSize: 16);
  static TextStyle heading7Bold = _headingBold.copyWith(fontSize: 12);
  static TextStyle heading8Bold = _headingBold.copyWith(fontSize: 10);

  static TextStyle heading1SemiBold = _headingSemiBold.copyWith(fontSize: 60);
  static TextStyle heading2SemiBold = _headingSemiBold.copyWith(fontSize: 48);
  static TextStyle heading3SemiBold = _headingSemiBold.copyWith(fontSize: 34);
  static TextStyle heading4SemiBold = _headingSemiBold.copyWith(fontSize: 24);
  static TextStyle heading5SemiBold = _headingSemiBold.copyWith(fontSize: 20);
  static TextStyle heading6SemiBold = _headingSemiBold.copyWith(fontSize: 16);
  static TextStyle heading7SemiBold = _headingSemiBold.copyWith(fontSize: 12);
  static TextStyle heading8SemiBold = _headingSemiBold.copyWith(fontSize: 10);

  static TextStyle heading1Medium = _headingMedium.copyWith(fontSize: 60);
  static TextStyle heading2Medium = _headingMedium.copyWith(fontSize: 48);
  static TextStyle heading3Medium = _headingMedium.copyWith(fontSize: 34);
  static TextStyle heading4Medium = _headingMedium.copyWith(fontSize: 24);
  static TextStyle heading5Medium = _headingMedium.copyWith(fontSize: 20);
  static TextStyle heading6Medium = _headingMedium.copyWith(fontSize: 16);
  static TextStyle heading7Medium = _headingMedium.copyWith(fontSize: 12);
  static TextStyle heading8Medium = _headingMedium.copyWith(fontSize: 10);

  static TextStyle heading1Regular = _headingRegular.copyWith(fontSize: 60);
  static TextStyle heading2Regular = _headingRegular.copyWith(fontSize: 48);
  static TextStyle heading3Regular = _headingRegular.copyWith(fontSize: 34);
  static TextStyle heading4Regular = _headingRegular.copyWith(fontSize: 24);
  static TextStyle heading5Regular = _headingRegular.copyWith(fontSize: 20);
  static TextStyle heading6Regular = _headingRegular.copyWith(fontSize: 16);
  static TextStyle heading7Regular = _headingRegular.copyWith(fontSize: 12);
  static TextStyle heading8Regular = _headingRegular.copyWith(fontSize: 10);

  static TextStyle body1Bold = _paragraphBold.copyWith(fontSize: 16);
  static TextStyle body2Bold = _paragraphBold.copyWith(fontSize: 14);
  static TextStyle body3Bold = _paragraphBold.copyWith(fontSize: 12);
  static TextStyle caption1Bold = _paragraphBold.copyWith(fontSize: 12);
  static TextStyle caption2Bold = _paragraphBold.copyWith(fontSize: 10);

  static TextStyle body1Medium = _paragraphMedium.copyWith(fontSize: 16);
  static TextStyle body2Medium = _paragraphMedium.copyWith(fontSize: 14);
  static TextStyle body3Medium = _paragraphMedium.copyWith(fontSize: 12);
  static TextStyle caption1Medium = _paragraphMedium.copyWith(fontSize: 12);
  static TextStyle caption2Medium = _paragraphMedium.copyWith(fontSize: 10);

  static TextStyle body1Regular = _paragraphRegular.copyWith(fontSize: 16);
  static TextStyle body2Regular = _paragraphRegular.copyWith(fontSize: 14);
  static TextStyle body3Regular = _paragraphRegular.copyWith(fontSize: 12);
  static TextStyle caption1Regular = _paragraphRegular.copyWith(fontSize: 12);
  static TextStyle caption2Regular = _paragraphRegular.copyWith(fontSize: 10);

  static TextStyle button1Regular = body1Regular;
  static TextStyle button2Regular = body2Regular;

  static TextStyle button1Medium = body1Medium;
  static TextStyle button2Medium = body2Medium;

  static TextStyle button1Bold = body1Bold;
  static TextStyle button2Bold = body2Bold;

  static TextStyle field1Regular = body1Regular;
  static TextStyle field1Medium = body1Medium;
  static TextStyle field1Bold = body1Bold;
}

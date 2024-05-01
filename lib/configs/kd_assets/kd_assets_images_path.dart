part of 'app_assets.dart';

class KdAssetsImagesPath {
  static String get _imageFolder => 'assets/images';

  static String get _flagsFolder => '$_imageFolder/flags';
  static String get _logosFolder => '$_imageFolder/logos';
  static String get _onboardsFolder => '$_imageFolder/onboards';
  static String get _iconFolder => '$_imageFolder/icons';
  static String get _profilesFolder => '$_imageFolder/profiles';

  // folder assets/images/icons
  static String get _registerFolder => '$_iconFolder/register';
  static String google = '$_iconFolder/ic_google.png';

  // folder assets/images/icons/register
  static String registerSchool = '$_registerFolder/ic_school.png';
  static String registerGeneral = '$_registerFolder/ic_general.png';
  static String registerLecture = '$_registerFolder/ic_lecture.png';
  static String registerGraduate = '$_registerFolder/ic_graduate.png';

  // folder assets/images/flags
  static String flagsIndonesia = '$_flagsFolder/id.png';
  static String flagsEnglish = '$_flagsFolder/en.png';

  // folder assets/images/logos
  static String logosFull = '$_logosFolder/full.png';
  static String logosIcon = '$_logosFolder/icon.png';
  static String logosIcBg = '$_logosFolder/ic_bg.png';
  static String logosIcCircle = '$_logosFolder/ic_circle.png';
  static String logosIcDev = '$_logosFolder/ic_dev.png';
  static String logosIcStag = '$_logosFolder/ic_stg.png';
  static String logosText = '$_logosFolder/text.png';
  static String logosIcText = '$_logosFolder/ic_text.png';

  // folder assets/images/onboards
  static String onboards1 = '$_onboardsFolder/1.png';
  static String onboards2 = '$_onboardsFolder/2.png';
  static String onboards3 = '$_onboardsFolder/3.png';

  // folder assets/images/onboards
  static String noPicture = '$_profilesFolder/no_picture.png';
  static String verified = '$_profilesFolder/verified.png';
  static String verifiedWhite = '$_profilesFolder/verified_white.png';
}

import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          AppTranslateString.home: 'Home',
          AppTranslateString.dashboard: 'Dashboard',
          AppTranslateString.classroom: 'Class',
          AppTranslateString.calendar: 'Calendar',
          AppTranslateString.market: 'Market',
          AppTranslateString.selectLanguage: 'Select Language',
          AppTranslateString.onboard1:
              'Users can continue to access various new learning materials digitally, even when they no longer have student status.',
          AppTranslateString.onboard2:
              'Become a forum for sharing knowledge, organizing conferences and sending messages to each other',
          AppTranslateString.onboard3:
              'Kelas Digital can be a medium for various parties to collaborate, especially teaching staff and students around the world',
          AppTranslateString.next: 'Next',
          AppTranslateString.skip: 'Skip',
          AppTranslateString.emptyEmailValidation: 'Email cannot be empty',
          AppTranslateString.emptyPasswordValidation:
              'Password cannot be empty',
          AppTranslateString.language: 'Language',
        },
        'id': {
          AppTranslateString.home: 'Beranda',
          AppTranslateString.dashboard: 'Dasbor',
          AppTranslateString.classroom: 'Kelas',
          AppTranslateString.calendar: 'Kalender',
          AppTranslateString.market: 'Market',
          AppTranslateString.selectLanguage: 'Pilih Bahasa',
          AppTranslateString.onboard1:
              'Pengguna dapat terus mengakses berbagai bahan pembelajaran yang baru secara digital, bahkan ketika sudah tidak berstatus pelajar.',
          AppTranslateString.onboard2:
              'Menjadi wadah berbagi ilmu, penyelenggara konferensi dan saling mengirim pesan',
          AppTranslateString.onboard3:
              'Kelas Digital dapat menjadi medium berbagai pihak untuk berkolaborasi, khususnya tenaga pengajar dan pelajar di seluruh dunia',
          AppTranslateString.next: 'Lanjut',
          AppTranslateString.skip: 'Lewati',
          AppTranslateString.emptyEmailValidation:
              'Username tidak boleh kosong',
          AppTranslateString.emptyPasswordValidation:
              'Password tidak boleh kosong',
          AppTranslateString.language: 'Bahasa',
        },
      };
}

class AppTranslateString {
  // ========= INITIALIZE ============
  static const String selectLanguage = 'selectLanguage';
  static const String onboard1 = 'onboard1';
  static const String onboard2 = 'onboard2';
  static const String onboard3 = 'onboard3';
  static const String next = 'next';
  static const String skip = 'skip';

  // ========= AUTH ============
  static const String emptyEmailValidation = 'emptyUsernameValidation';
  static const String emptyPasswordValidation = 'emptyPasswordValidation';

  // ========= MAIN ============
  static const String home = 'home';
  static const String dashboard = 'dashboard';
  static const String classroom = 'classroom';
  static const String calendar = 'calendar';
  static const String market = 'market';

  // ========= OTHER ============
  static const String language = 'language';
}

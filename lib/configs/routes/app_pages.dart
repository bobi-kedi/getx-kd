import 'package:get/get.dart';
import 'package:kelasdigital/features/auth/forgot_password/forgot_password_binding.dart';
import 'package:kelasdigital/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:kelasdigital/features/auth/login/login_binding.dart';
import 'package:kelasdigital/features/auth/login/login_screen.dart';
import 'package:kelasdigital/features/auth/reset_password/reset_password_binding.dart';
import 'package:kelasdigital/features/auth/reset_password/reset_password_screen.dart';
import 'package:kelasdigital/features/other/modules/change_language/change_language_binding.dart';
import 'package:kelasdigital/features/other/modules/change_language/change_language_screen.dart';
import 'package:kelasdigital/features/other/modules/change_password/change_password_binding.dart';
import 'package:kelasdigital/features/other/modules/change_password/change_password_screen.dart';
import 'package:kelasdigital/features/other/modules/saved_feed/saved_feed_binding.dart';
import 'package:kelasdigital/features/other/modules/saved_feed/saved_feed_screen.dart';
import 'package:kelasdigital/features/other/other_binding.dart';
import 'package:kelasdigital/features/other/other_screen.dart';
import 'package:kelasdigital/features/profile/modules/bank_account/bank_account_binding.dart';
import 'package:kelasdigital/features/profile/modules/bank_account/bank_account_screen.dart';
import 'package:kelasdigital/features/profile/modules/detail_profile/detail_profile_binding.dart';
import 'package:kelasdigital/features/profile/modules/detail_profile/detail_profile_screen.dart';
import 'package:kelasdigital/features/profile/modules/edit_profile/edit_profile_binding.dart';
import 'package:kelasdigital/features/profile/modules/edit_profile/edit_profile_screen.dart';
import 'package:kelasdigital/features/profile/profile_binding.dart';
import 'package:kelasdigital/features/profile/profile_screen.dart';
import 'package:kelasdigital/features/auth/register/register_binding.dart';
import 'package:kelasdigital/features/auth/register/register_form/register_form_binding.dart';
import 'package:kelasdigital/features/auth/register/register_form/register_form_screen.dart';
import 'package:kelasdigital/features/auth/register/register_otp/register_otp_binding.dart';
import 'package:kelasdigital/features/auth/register/register_otp/register_otp_screen.dart';
import 'package:kelasdigital/features/auth/register/register_role/register_role_binding.dart';
import 'package:kelasdigital/features/auth/register/register_role/register_role_screen.dart';
import 'package:kelasdigital/features/auth/register/register_screen.dart';
import 'package:kelasdigital/features/auth/register/register_verify/register_verify_binding.dart';
import 'package:kelasdigital/features/auth/register/register_verify/register_verify_screen.dart';
import 'package:kelasdigital/features/calendar/calendar_binding.dart';
import 'package:kelasdigital/features/calendar/calendar_screen.dart';
import 'package:kelasdigital/features/chat/chat_binding.dart';
import 'package:kelasdigital/features/chat/chat_screen.dart';
import 'package:kelasdigital/features/conversation/conversation_binding.dart';
import 'package:kelasdigital/features/conversation/conversation_screen.dart';
import 'package:kelasdigital/features/dashboard/dashboard_binding.dart';
import 'package:kelasdigital/features/dashboard/dashboard_screen.dart';
import 'package:kelasdigital/features/home/home_binding.dart';
import 'package:kelasdigital/features/home/home_screen.dart';
import 'package:kelasdigital/features/main/main_binding.dart';
import 'package:kelasdigital/features/main/main_screen.dart';
import 'package:kelasdigital/features/market/market_binding.dart';
import 'package:kelasdigital/features/market/market_screen.dart';
import 'package:kelasdigital/features/onboard/onboard_binding.dart';
import 'package:kelasdigital/features/onboard/onboard_screen.dart';
import 'package:kelasdigital/features/select_language/select_language_binding.dart';
import 'package:kelasdigital/features/select_language/select_language_screen.dart';
import 'package:kelasdigital/features/welcome/welcome_binding.dart';
import 'package:kelasdigital/features/welcome/welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    // ========= COMMON ============
    GetPage(
      name: _Paths.SELECT_LANGUAGE,
      page: () => const SelectLanguageScreen(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardScreen(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),

    // ========= AUTH ============
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_ROLE,
      page: () => const RegisterRoleScreen(),
      binding: RegisterRoleBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_FORM,
      page: () => const RegisterFormScreen(),
      binding: RegisterFormBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP,
      page: () => const RegisterOtpScreen(),
      binding: RegisterOtpBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_VERIFY,
      page: () => const RegisterVerifyScreen(),
      binding: RegisterVerifyBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),

    // ========= MAIN ============
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainScreen(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => const DashboardScreen(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.CONVERSATION,
          page: () => const ConversationScreen(),
          binding: ConversationBinding(),
        ),
        GetPage(
          name: _Paths.CALENDAR,
          page: () => const CalendarScreen(),
          binding: CalendarBinding(),
        ),
        GetPage(
          name: _Paths.MARKET,
          page: () => const MarketScreen(),
          binding: MarketBinding(),
        ),
      ],
    ),

    // ========= PROFILE ============
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_PROFILE,
          page: () => const DetailProfileScreen(),
          binding: DetailProfileBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_PROFILE,
          page: () => const EditProfileScreen(),
          binding: EditProfileBinding(),
        ),
        GetPage(
          name: _Paths.BANK_ACCOUNT,
          page: () => const BankAccountScreen(),
          binding: BankAccountBinding(),
        ),
      ],
    ),

    // ========= OTHER ============
    GetPage(
      name: _Paths.OTHER,
      page: () => const OtherScreen(),
      binding: OtherBinding(),
      children: [
        GetPage(
          name: _Paths.CHANGE_PASSWORD,
          page: () => const ChangePasswordScreen(),
          binding: ChangePasswordBinding(),
        ),
        GetPage(
          name: _Paths.CHANGE_LANGUAGE,
          page: () => const ChangeLanguageScreen(),
          binding: ChangeLanguageBinding(),
        ),
        GetPage(
          name: _Paths.SAVED_FEED,
          page: () => const SavedFeedScreen(),
          binding: SavedFeedBinding(),
        ),
      ],
    ),

    // ========= CHAT ============
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}

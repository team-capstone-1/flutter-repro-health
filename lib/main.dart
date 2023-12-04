import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/appoinment/appoinment_view.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/appointment_history_details_view.dart';
import 'package:reprohealth_app/screen/article/article_detail_view.dart';
import 'package:reprohealth_app/screen/article/article_view.dart';
import 'package:reprohealth_app/screen/article/bookmark_view.dart';
import 'package:reprohealth_app/screen/article/comment_view.dart';
import 'package:reprohealth_app/screen/cancel_appointment_payment_at_clinic/cancel_appointment_payment_at_clinic_view.dart';
import 'package:reprohealth_app/screen/choice/choice_view.dart';
import 'package:reprohealth_app/screen/confirm_status/confirm_status_view.dart';
import 'package:reprohealth_app/screen/dokter/detail_dokter_view.dart';
import 'package:reprohealth_app/screen/dokter/jadwal_dokter_view.dart';
import 'package:reprohealth_app/screen/dokter/janji_temu_view.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_sesi_view_model.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_tanggal_view_model.dart';
import 'package:reprohealth_app/screen/forgot_password/detail_forgot_password_view.dart';
import 'package:reprohealth_app/screen/forgot_password/forgot_password_view.dart';
import 'package:reprohealth_app/screen/forgot_password/otp_view.dart';
import 'package:reprohealth_app/screen/forum/create_forum_view.dart';
import 'package:reprohealth_app/screen/forum/detail_forum_view.dart';
import 'package:reprohealth_app/screen/forum/forum_view.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/screen/home/home_view.dart';
import 'package:reprohealth_app/screen/home/home_view_model.dart';
import 'package:reprohealth_app/screen/klinik/detail_klinik_view.dart';
import 'package:reprohealth_app/screen/klinik/klinik_view.dart';
import 'package:reprohealth_app/screen/klinik/search_klinik_view.dart';
import 'package:reprohealth_app/screen/klinik/view_models/clinics_view_model.dart';
import 'package:reprohealth_app/screen/klinik/view_models/search_klinik_view_model.dart';
import 'package:reprohealth_app/screen/location/detail_location_view.dart';
import 'package:reprohealth_app/screen/location/location_view.dart';
import 'package:reprohealth_app/screen/login/login_view.dart';
import 'package:reprohealth_app/screen/maps/maps_view.dart';
import 'package:reprohealth_app/screen/maps/maps_view_models/maps_view_model.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/confirmation_splash_view.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/payment_method_view.dart';
import 'package:reprohealth_app/screen/onboarding/onbarding_view.dart';
import 'package:reprohealth_app/screen/profile/about_us_view.dart';
import 'package:reprohealth_app/screen/profile/add_family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/change_password_view.dart';
import 'package:reprohealth_app/screen/profile/change_profile_view.dart';
import 'package:reprohealth_app/screen/profile/family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/kebijakan_privasi_view.dart';
import 'package:reprohealth_app/screen/profile/ketentuan_pengguna_view.dart';
import 'package:reprohealth_app/screen/profile/my_profile_view.dart';
import 'package:reprohealth_app/screen/profile/profile_view.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pusat_bantuan_view.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/delete_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/file_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/post_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/put_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/refund/refund_view.dart';
import 'package:reprohealth_app/screen/refund_details/refund_details_view.dart';
import 'package:reprohealth_app/screen/register/register_view.dart';
import 'package:reprohealth_app/screen/register/success_register_view.dart';
import 'package:reprohealth_app/screen/register/view_model/register_view_model.dart';
import 'package:reprohealth_app/screen/reschedule/reschedule_view.dart';
import 'package:reprohealth_app/screen/riwayat/riwayat_view.dart';
import 'package:reprohealth_app/screen/spesialis/detail_spesialis_view.dart';
import 'package:reprohealth_app/screen/spesialis/spesialis_view.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/detail_spesialis_view_model.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/specialist_view_model.dart';
import 'package:reprohealth_app/screen/splash/splash_view.dart';
import 'package:reprohealth_app/screen/splash/view_model/splash_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterViewModels()),
        ChangeNotifierProvider(create: (context) => HomeViewModels()),
        ChangeNotifierProvider(create: (context) => DatePickerViewModel()),
        ChangeNotifierProvider(
            create: (context) => GetFamilyProfileViewModel()),
        ChangeNotifierProvider(create: (context) => FilePickerViewModel()),
        ChangeNotifierProvider(
            create: (context) => PostFamilyProfileViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModels()),
        ChangeNotifierProvider(create: (context) => AppoinmentViewModel()),
        ChangeNotifierProvider(create: (context) => SpecialistViewModels()),
        ChangeNotifierProvider(create: (context) => DetailSpesialisViewModel()),
        ChangeNotifierProvider(create: (context) => SearchKlinikViewModel()),
        ChangeNotifierProvider(create: (context) => ClinicsViewModel()),
        ChangeNotifierProvider(create: (context) => MapsViewModel()),
        ChangeNotifierProvider(create: (context) => PilihSesiViewModel()),
        ChangeNotifierProvider(create: (context) => PilihTanggalViewModel()),
        ChangeNotifierProvider(
          create: (context) => HomeViewModels(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatePickerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetFamilyProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilePickerViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostFamilyProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PutFamilyProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeleteProfileFamilyViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModels(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppoinmentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpecialistViewModels(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailSpesialisViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchKlinikViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClinicsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PilihSesiViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PilihTanggalViewModel(),
        ),
        ChangeNotifierProvider(create: (context) => SplashViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModels()),
        ChangeNotifierProvider(create: (context) => ForumViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ReproHealth+',
        initialRoute: RoutesNavigation.splashView,
        routes: {
          RoutesNavigation.splashView: (context) => const SplashView(),
          RoutesNavigation.onboardingView: (context) => const OnboardingView(),
          RoutesNavigation.choiceView: (context) => const ChoiceView(),
          RoutesNavigation.loginView: (context) => const LoginView(),
          RoutesNavigation.registerView: (context) => const RegisterView(),
          RoutesNavigation.successRegisterView: (context) =>
              const SuccessRegisterView(),
          RoutesNavigation.forgotPasswordView: (context) =>
              const ForgotPasswordView(),
          RoutesNavigation.otpView: (context) => const OtpView(),
          RoutesNavigation.detailForgotPasswordView: (context) =>
              const DetailForgotPasswordView(),
          RoutesNavigation.homeView: (context) => const HomeView(),
          RoutesNavigation.articleView: (context) => const ArticleView(),
          RoutesNavigation.articleDetailView: (context) =>
              const ArticleDetailView(),
          RoutesNavigation.bookmarkView: (context) => const BookmarkView(),
          RoutesNavigation.commentView: (context) => const CommentView(),
          RoutesNavigation.forumView: (context) => const ForumView(),
          RoutesNavigation.detailForumView: (context) =>
              const DetailForumView(),
          RoutesNavigation.createForumView: (context) =>
              const CreateForumView(),
          RoutesNavigation.riwayatView: (context) => const RiwayatView(),
          RoutesNavigation.spesialisView: (context) => const SpesialisView(),
          RoutesNavigation.detailSpesialisView: (context) =>
              const DetailSpesialisView(),
          RoutesNavigation.klinikView: (context) => const KlinikView(),
          RoutesNavigation.detailKlinikView: (context) =>
              const DetailKlinikView(),
          RoutesNavigation.searchKlinikView: (context) =>
              const SearchKlinikView(),
          RoutesNavigation.detailDokterView: (context) =>
              const DetailDokterView(),
          RoutesNavigation.locationView: (context) => const LocationView(),
          RoutesNavigation.detailLocationView: (context) =>
              const DetailLocationView(),
          RoutesNavigation.appoinmentView: (context) => const AppoinmentView(),
          RoutesNavigation.mapsView: (context) => const MapsView(),
          RoutesNavigation.jadwalDokterView: (context) =>
              const JadwalDokterView(),
          RoutesNavigation.janjiTemuView: (context) => const JanjiTemuView(),

          //profile routes
          RoutesNavigation.profileView: (context) => const ProfileView(),
          RoutesNavigation.myProfile: (context) => const MyProfile(),
          RoutesNavigation.familyProfile: (context) => const FamilyProfile(),
          RoutesNavigation.changePasswordView: (context) =>
              const ChangePasswordView(),
          RoutesNavigation.aboutUs: (context) => const AboutUs(),
          RoutesNavigation.pusatBantuanView: (context) =>
              const PusatBantuanView(),
          RoutesNavigation.ketentuanPenggunaView: (context) =>
              const KetentuanPenggunaView(),
          RoutesNavigation.kebijakanPrivasiView: (context) =>
              const KebijakanPrivasiView(),
          RoutesNavigation.changeProfileView: (context) =>
              const ChangeProfileView(),
          RoutesNavigation.addFamilyProfile: (context) =>
              const AddFamilyProfile(),

          // riwayat transaksi
          RoutesNavigation.appointmentHistoryDetailView: (context) =>
              const AppointmentHistoryDetailsView(),
          RoutesNavigation.refundView: (context) => const RefundView(),
          RoutesNavigation.refundDetailsView: (context) =>
              const RefundDetailsView(),
          RoutesNavigation.rescedhuleView: (context) => const RescheduleView(),
          RoutesNavigation.canceAppointmentPaymentAtClinic: (context) =>
              const CancelAppointmentPaymentAtClicic(),
          RoutesNavigation.confirmStatusView: (context) =>
              const ConfirmStatusView(),

          // payment method
          RoutesNavigation.paymentMethodView: (context) =>
              const PaymentMethodView(),
          RoutesNavigation.confirmSplashView: (context) =>
              const ConfirmationSplashView(),
        },
      ),
    );
  }
}

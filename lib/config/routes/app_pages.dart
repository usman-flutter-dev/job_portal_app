import 'package:job_app/app_imports.dart';
import 'package:job_app/mvvm/view/splash.dart';
import 'package:job_app/mvvm/viewModel/bindings/job_bindings.dart';

class AppPages {
  static const initial = AppRoutes.initial;

  static final routes = [
    // initial Splash
    GetPage(
      name: AppRoutes.initial,
      page: () => Splash(),
      binding: AuthBindings(),
    ),
    // Register
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBindings(),
    ),

    // Login Screen
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),

    // Jobs Listing Screen
    GetPage(
      name: AppRoutes.jobsList,
      page: () => const JobListingScreen(),
      binding: JobBindings(),
    ),

    // Add Job Screen
    GetPage(
      name: AppRoutes.addJob,
      page: () => AddJobScreen(),
      binding: JobBindings(),
    ),

    // You Can Add Mode Pages Below
  ];
}

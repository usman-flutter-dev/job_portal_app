import 'package:flutter/services.dart';
import 'package:job_app/app_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Title Section ---
                Text(
                  "Let's sign you in",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: AppResponsive.sp(context, 0.1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppResponsive.hp(context, 0.015)),
                Text(
                  "Welcome back \nYou've been missed!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppResponsive.sp(context, 0.09),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppResponsive.hp(context, 0.06)),
                // --- Text Fields ---
                AppTextField(
                  controller: loginController.emailController,
                  hintText: "Enter your email address",
                ),
                SizedBox(height: AppResponsive.hp(context, 0.02)),
                // Password field is hidden
                AppTextField(
                  controller: loginController.passwordController,
                  textAlignVertical: TextAlignVertical(y: 0.05),
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),

                SizedBox(height: AppResponsive.hp(context, 0.25)),

                /// Try Spacer instead of SizedBox
                // Spacer(),
                //

                // Don't have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                        color: Colors.white70, // Slightly faded text
                        fontSize: AppResponsive.sp(context, 0.04),
                      ),
                    ),
                    SizedBox(width: AppResponsive.wp(context, 0.01)),
                    // Link text
                    GestureDetector(
                      onTap: () {
                        // Action for Sign In
                        Get.back();
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: AppResponsive.sp(context, 0.04),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppResponsive.hp(context, 0.02)),
                // --- Sign Up Button ---
                AppButton(
                  text: "Sign In",
                  onPressed: () {
                    loginController.loginUser();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

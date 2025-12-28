import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/app_imports.dart';

class RegisterController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearFields() {
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  //
  // Firebase Instances
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Create Register Function with Named Optional Perameters
  // These perameters will be later stored in Firestore / Firebase
  Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    // All Fields must not be Empty
    if (email.isEmpty || password.isEmpty || fullName.isEmpty) {
      Get.snackbar(
        'Empty Field',
        'All fields are required!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: Duration(seconds: 3),
        borderRadius: 13,
        margin: EdgeInsets.all(10),
      );
      return;
    }
    // Password Length must not be less than 6 Characters
    if (password.length < 6) {
      Get.snackbar(
        'Password',
        'Password should be at least 6 characters!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: Duration(seconds: 3),
        borderRadius: 13,
        margin: EdgeInsets.all(10),
      );
      return;
    }
    // Many more Validations we can add below like Above
    //
    try {
      // Get Values
      // 01 - Firebase Authentication (Email & Password Store)
      final credentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 02 - Successfully created user, now get the unique User ID (UID)
      final uid = credentials.user!.uid;

      // 03 - Firestore Storage (Storing Profile Details)
      // Hum ek 'users' collection banayenge aur UID ko Document ID banayenge
      await fireStore.collection("users").doc(uid).set({
        "uid": uid,
        "fullName": fullName,
        "email": email,
        // "password": password,
        "createdAt": Timestamp.now(),
      });

      // Success Notification
      Get.snackbar(
        'Success',
        'Your account has been created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.successGreen,
        colorText: AppColors.white,
        // duration: Duration(seconds: 3),
        borderRadius: 13,
        margin: EdgeInsets.all(16),
      );
      Get.offAllNamed(AppRoutes.jobsList);
    } on FirebaseAuthException catch (e) {
      RxString errorMessage = "".obs;

      switch (e.code) {
        case 'weak-password':
          errorMessage.value = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage.value = 'An account already exists for that email.';
          break;
        case 'invalid-email':
          errorMessage.value = 'The email address is not valid.';
          break;
        default:
          // Fallback for less common Firebase errors
          errorMessage.value = 'Firebase Error: ${e.message}';
      }

      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: Duration(seconds: 4),
        borderRadius: 13,
        margin: EdgeInsets.all(10),
      );
    } catch (e) {
      // Catch all other non-Firebase-related errors (e.g., network issues
      // In case any Error Comes
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: Duration(seconds: 3),
        borderRadius: 13,
        margin: EdgeInsets.all(10),
      );
    }
  }
}

import 'package:job_app/app_imports.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final TextAlignVertical? textAlignVertical;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final int? maxLines;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.textAlignVertical,
    this.obscureText = false,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1C24),
        border: Border.all(color: const Color(0xff5D5D67), width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText!,
        // maxLines: maxLines,
        // scrollPhysics: NeverScrollableScrollPhysics(),
        style: GoogleFonts.poppins(color: AppColors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hintText,
          // Hint text color - slightly faded white
          hintStyle: GoogleFonts.poppins(
            color: Color(0xFF8F8F9E),
            fontSize: 15,
          ),
          border: InputBorder.none,
          // contentPadding: const EdgeInsets.symmetric(vertical: 12),

          // No suffix icon implementation, keeping it simple as requested
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

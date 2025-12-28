import 'package:job_app/app_imports.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(color: Colors.white),
            Text("Loading...", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

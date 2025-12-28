import 'package:job_app/app_imports.dart';
import 'package:job_app/mvvm/viewModel/controllers/job_controller.dart';

class AddJobScreen extends StatelessWidget {
  AddJobScreen({super.key});

  final JobController jobController = Get.find<JobController>();
  final positionNameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back, color: AppColors.white),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Add New Job",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 31),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: AppTextField(
                  controller: positionNameController,
                  hintText: "Enter position name",
                ),
              ),
              Container(
                height: 274,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: AppTextField(
                  controller: descriptionController,
                  hintText: "Describe Requirement...",
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: AppButton(
          text: "Submit Job",
          onPressed: () {
            final position = positionNameController.text.trim();
            final description = descriptionController.text.trim();
            if (position.isEmpty || description.isEmpty) {
              Get.snackbar(
                "Empty Field",
                "All fields are required!",
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.all(16),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
            jobController.addJob(position, description);
          },
        ),
      ),
    );
  }
}

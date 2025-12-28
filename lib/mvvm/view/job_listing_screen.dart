import 'package:job_app/app_imports.dart';
import 'package:job_app/mvvm/viewModel/controllers/job_controller.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobController = Get.find<JobController>();
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header (Welcome, Name, Logout Icon)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Welcome Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Ishaq Hassan",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Logout Icon
                  IconButton(
                    onPressed: () {
                      // Replace with GetX controller logout logic
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. Corrected Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "Search keywords..",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    prefixIconConstraints: BoxConstraints(minWidth: 40),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 3. Job List Placeholder
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() {
                  // 01
                  final jobs = jobController.jobList;
                  // 02
                  if (jobs.isEmpty) {
                    return Center(
                      child: Text(
                        "No jobs posted yet. Add one!",
                        style: GoogleFonts.poppins(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  // 03
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    // Provide Actual Length Here
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      // Get the job model
                      final job = jobs[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          // height: 90,
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        job.positionName,

                                        style: GoogleFonts.poppins(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        job.description,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    // Edit Icon
                                    Icon(
                                      Icons.edit,
                                      color: AppColors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 4),
                                    // Delete Icon
                                    GestureDetector(
                                      onTap: () {
                                        jobController.deleteJob(job.id);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
                //
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addJob);
        },
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, color: AppColors.black, size: 30),
      ),
    );
  }
}

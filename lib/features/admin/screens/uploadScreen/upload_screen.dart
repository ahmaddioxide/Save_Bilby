import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:save_the_bilby_fund/features/admin/screens/uploadScreen/upload_screen_backend.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/custom_appbar.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}
class _UploadScreenState extends State<UploadScreen> {
  final progressController = Get.put(UploadProgressController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customAppBar("Admin Panel", Icons.arrow_back),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:  () {
          progressController.isUploading.isTrue?null
          :SelectAndUploadImages();
        },
        label: Text("Upload Images"),
        icon: Icon(Icons.upload_rounded),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Obx(() {
                  if (progressController.isUploading.isTrue) {
                    return LiquidCircularProgressIndicator(
                      // animation: true,
                      // animationDuration: 1000,
                      direction: Axis.vertical,
                      borderColor: Colors.blue.shade500,
                      borderWidth: 5.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      center: Text(
                          "${((double.parse(progressController.imagesUploaded.toString()) / double.parse(progressController.totalImagesToUpload.toString())) * 100).toInt()}" +
                              "%"),
                      value: double.parse(
                              progressController.imagesUploaded.toString()) /
                          double.parse(progressController.totalImagesToUpload
                              .toString()),
                    );
                  } else if (progressController.isDoneUploading.isTrue) {
                    return Center(
                      child: Container(
                          child: Text(
                        "Done Upload",
                        style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold),
                      )),
                    );
                  } else {
                    return Center(
                      child: Container(
                          child: Text(
                        "Select Images",
                        style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold),
                      )),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

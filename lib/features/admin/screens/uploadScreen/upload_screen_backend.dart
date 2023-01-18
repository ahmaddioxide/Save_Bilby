import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebaseCore;
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//Controller for upload Screen
class UploadProgressController extends GetxController {
  var imagesUploaded = 0.obs;//to check how many images have been uploaded
  var isUploading = false.obs;//to check either you are uploading images or not
  void increment() => imagesUploaded++;//GetX function to increment imagesUploaded
  var isDoneUploading = false.obs;//Bool to check if uploading is completed or not
  var totalImagesToUpload = 0.obs;//count to get how many images is going to upload in a shot
}
final uploadProgressController = Get.put(UploadProgressController());//crating GetX controller
final ImagePicker imagePicker = ImagePicker();//image picker instance that pick images from gallery
List<XFile>? imageFiles = [];//list of files to be uploaded (XFiles)
final imagesDatabaseRef = FirebaseDatabase.instance.ref().child("images");//images Database reference
final datastoreRef = FirebaseStorage.instance.ref();//firebase datastore reference\

//function to select images from gallery and upload it to database
Future SelectAndUploadImages() async {
  final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //if user have selected images
  if (selectedImages!.isNotEmpty)
  {
    debugPrint("Number of images selected = ${selectedImages.length}");
    //   int latestImageNumber =await getLastImageNumber();
    uploadProgressController.totalImagesToUpload.value = selectedImages.length;
    for (var image in selectedImages) {
      uploadProgressController.isUploading.value = true;
      File imageFileToUpload = await File(image.path); // selectedImages as XFile
      String fileName = await basename(image.path); //getting file name from the path
      fileName = fileName.substring(12, fileName.length - 4); //removing "image_picker" from start and ".jpg" from the end of file name
      fileName=fileName.replaceAll(RegExp('[^A-Za-z0-9]'), '');// removing special characters expect alphabets and numbers
      debugPrint("FILE NAME IS : ${fileName}");

      try {
        await datastoreRef
            .child('images/${fileName}')
            .putFile(imageFileToUpload)
            .whenComplete(() async {
          uploadProgressController.increment();//incrementing when a file is done uploading
          await datastoreRef
          //uploading images data to firebase realtime database
              .child('images/${fileName}')
              .getDownloadURL()
          //getting download URL of uploaded image
              .then((imageURL) async {
                //putting downloadURL to database with name and other attributes
            debugPrint("DOWNLOAD URL: ${imageURL}");
            await imagesDatabaseRef.child("${fileName}").set({
              "imageName": "${fileName}",
              "dateUploaded": "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              "imageURL": "${imageURL}",
              "isCategorized":"false",
              "categoryId":"unknown",
            });
          }).whenComplete(() => () {
//printing image name when done uploading is data to realtime database
                    debugPrint(
                        "Image Data saved to Realtime Database: ${fileName}");
                  });
        });
      } on firebaseCore.FirebaseException catch (e) {
        debugPrint("Error in Uploading File $e");
      }
    }
    //resetting variables
    uploadProgressController.isUploading.value = false;
    uploadProgressController.isDoneUploading.value = true;
    uploadProgressController.imagesUploaded.value=0;
    uploadProgressController.totalImagesToUpload.value=0;
  } else {
    debugPrint("No picture Selected");
  }
}

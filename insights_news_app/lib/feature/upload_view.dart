import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news_app/core/appcolors.dart';
import 'package:insights_news_app/core/app_local_storage.dart';
import 'package:insights_news_app/feature/home/home_view.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  void initState() {
    super.initState();
    AppLocal.getCached(AppLocal.imageKey).then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  AppLocal.cacheData(AppLocal.nameKey, name);
                  AppLocal.cacheBool(AppLocal.isUpload, true);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeView()));
                } else if (imagePath == null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content:
                          Text('Please Upload an image and enter your name')));
                } else if (imagePath == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Upload an image')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please enter your name')));
                }
              },
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: (imagePath != null)
                    ? FileImage(File(imagePath!)) as ImageProvider
                    : const AssetImage('assets/user.jpg'),
              ),
              const SizedBox(height: 20),

              //First Button to get an image from the camera
              GestureDetector(
                onTap: () {
                  getImageFromCamera();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.containerBG),
                  child: Text(
                    'Upload Picture from Camera',
                    style: TextStyle(
                        color: AppColors.lemonade, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              //Second Button to get an image from the gallery
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.containerBG),
                  child: Text(
                    'Upload Picture from Gallery',
                    style: TextStyle(
                        color: AppColors.lemonade, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Divider(
                  color: AppColors.lemonade,
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                cursorColor: AppColors.lemonade,
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: AppColors.grey),
                  filled: true,
                  fillColor: AppColors.containerBG,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
        imagePath = pickedImage.path;
      });
    }
  }

  getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}

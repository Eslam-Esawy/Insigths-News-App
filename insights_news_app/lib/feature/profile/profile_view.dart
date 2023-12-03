import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:insights_news_app/core/app_local_storage.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/home/home_view.dart";

String? imagePath;
String name = '';
// ignore: prefer_typing_uninitialized_variables
var textCon = TextEditingController();

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    AppLocal.getCached(AppLocal.imageKey).then((value) {
      setState(() {
        imagePath = value;
      });
    });
    AppLocal.getCached(AppLocal.nameKey).then((value) {
      setState(() {
        name = value;
        textCon = TextEditingController(text: name);
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
                } else if (imagePath != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Please Enter your name")));
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: (imagePath != null)
                      ? FileImage(File(imagePath!)) as ImageProvider
                      : const AssetImage('assets/user.jpg'),
                ),
                const SizedBox(height: 40),
                Divider(color: AppColors.lemonade, thickness: 1),
                const SizedBox(height: 40),

                //Name Box
                TextFormField(
                  controller: textCon,
                  onFieldSubmitted: (value) {
                    if (name.isNotEmpty) {
                      AppLocal.cacheData(AppLocal.nameKey, name);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please Enter your name')));
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                    AppLocal.cacheData(AppLocal.nameKey, name);
                  },
                  cursorColor: AppColors.lemonade,
                  style: TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(color: AppColors.grey),
                    filled: true,
                    fillColor: AppColors.containerBG,
                  ),
                ),
                const SizedBox(height: 40),

                //First button to upload from camera
                GestureDetector(
                  onTap: () {
                    getImageFromCamera();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.containerBG),
                    child: Text(
                      'Upload From Camera',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.lemonade),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //Second button to upload from gallery
                GestureDetector(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.containerBG),
                    child: Text(
                      'Upload From Gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.lemonade),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.imageKey, pickedImage.path);
      setState(() {
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

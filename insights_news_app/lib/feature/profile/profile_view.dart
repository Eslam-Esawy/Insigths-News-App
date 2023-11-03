import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/home/home_view.dart";
import "package:insights_news_app/feature/auth/register_view.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: AssetImage(
                          'assets/Esawy.jpg',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt,
                              color: AppColors.lemonade, size: 40),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Divider(color: AppColors.lemonade, thickness: 1),
                  const SizedBox(height: 40),

                  //Name Box
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors.lemonade),
                    decoration: InputDecoration(
                        labelText: 'Enter your name here',
                        labelStyle: TextStyle(color: AppColors.lemonade),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.lemonade),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppColors.lemonade),
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

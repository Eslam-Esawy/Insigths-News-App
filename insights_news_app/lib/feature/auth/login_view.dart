import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/home/home_view.dart";
import "package:insights_news_app/feature/auth/register_view.dart";
import "package:insights_news_app/feature/profile/profile_view.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 303,
                  height: 235,
                ),
                const SizedBox(height: 30),

                //Email Box
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  style: TextStyle(color: AppColors.lemonade),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email), label: Text('Email')),
                ),
                const SizedBox(height: 20),

                //Password Box
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors.white),
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon((isVisible)
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_rounded)),
                        prefixIcon: const Icon(Icons.lock),
                        label: const Text('Password'))),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileView(),
                      ));
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.lemonade,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do Not have an account?',
                      style: TextStyle(
                        color: AppColors.lemonade,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                        },
                        child: const Text('Create one now!'))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

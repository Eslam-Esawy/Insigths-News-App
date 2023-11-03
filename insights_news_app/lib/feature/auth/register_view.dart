import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/auth/login_view.dart";

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    bool isVisible = true;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
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

                  //Name Box
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The "Name" is required';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors.lemonade),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person), label: Text('Name')),
                  ),
                  const SizedBox(height: 20),

                  //Email Box
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '"Email" is required';
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
                          return '"Password" is required';
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
                              icon: const Icon(Icons.remove_red_eye)),
                          prefixIcon: const Icon(Icons.lock),
                          label: const Text('Password'))),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginView(),
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
                      child: const Text('Register'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: AppColors.lemonade,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          },
                          child: const Text('Login Now!'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

import "package:flutter/material.dart";
import "package:insights_news_app/core/appcolors.dart";
import "package:insights_news_app/feature/upload_view.dart";
import "package:insights_news_app/core/app_local_storage.dart";
import "package:insights_news_app/feature/home/home_view.dart";


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      AppLocal.getBool(AppLocal.isUpload).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => value? const HomeView() : const UploadView()
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 303,
                height: 235,
              ),
              const SizedBox(height: 57),
              Text(
                'Insight News',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Stay informed, Anytime, Anywhere.',
                style: TextStyle(
                  color: Color(0xffB4AAAA),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

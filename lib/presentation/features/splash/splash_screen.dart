import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info/core/configs/theme/app_colors.dart';
import 'package:movie_info/main_screen.dart';
import 'package:movie_info/navigation/app_navigation.dart';
import 'package:movie_info/presentation/features/home/home_screen.dart';
import 'package:movie_info/presentation/features/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFinishState) {
          AppNavigator.pushReplacement(context, const MainScreen());
        }
      },
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.blue, Colors.red],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: const Center(
                child: Text(
                  "Movies Insights",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // This color will be masked by the gradient
                    fontSize: 30,
                    // Increase the font size
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    // Add letter spacing
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.secondBackground.withOpacity(0),
                AppColors.secondBackground
              ])),
        )
      ]),
    ));
  }
}

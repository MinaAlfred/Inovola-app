import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:inovola_app/constants/appColors.dart';
import 'package:inovola_app/constants/utils/size_config.dart';
import 'package:inovola_app/constants/widget/space_item.dart';
import 'package:inovola_app/modules/trip/veiw/trip_screen.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: MyColors.whiteColor,
      child: AnimatedSplashScreen(
          duration: 3000,
          centered: true,
          splashIconSize: 500,
          animationDuration: const Duration(seconds: 3),
          splash: Column(
            children: [
              Transform.scale(
                scale: 0.9,
                child: Image.asset(
                  'assets/images/inovola.png',
                  fit: BoxFit.fill,
                ),
              ),
              Transform.scale(
                scale: 0.5,
                child: LinearProgressIndicator(
                  minHeight: getHeight(7),
                  backgroundColor: MyColors.whiteColor,
                  color: MyColors.yellowColor,
                ),
              ),
            ],
          ),
          nextScreen: TripScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.transparent),
    );
  }
}

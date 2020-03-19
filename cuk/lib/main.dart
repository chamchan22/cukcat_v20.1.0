import 'package:cuk/providers/provider_account-controller.dart';
import 'package:cuk/providers/provider_carousel-indicator.dart';
import 'package:cuk/providers/provider_club-search-option.dart';
import 'package:cuk/providers/provider_firebase-auth.dart';
import 'package:cuk/providers/provider_notice-selector.dart';
import 'package:cuk/providers/provider_quick-link-controller.dart';
import 'package:cuk/providers/provider_sign-form-controller.dart';
import 'package:cuk/providers/provider_timer-setting.dart';
import 'package:cuk/screens/screen_bus-info.dart';
import 'package:cuk/screens/screen_club-channel.dart';
import 'package:cuk/screens/screen_cukcat-timer.dart';
import 'package:cuk/screens/screen_help.dart';
import 'package:cuk/screens/screen_main-bottom-tab-nav.dart';
import 'package:cuk/screens/screen_reset-password.dart';
import 'package:cuk/screens/screen_sign-form.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'providers/provider_sign-form-controller.dart';

void main() async {
  runApp(CUKCAT());
}

bool isItFirstData = true;

class CUKCAT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignFormController>(
          create: (_) => SignFormController(),
        ),
        ChangeNotifierProvider<FirebaseAuthProvider>(
          create: (_) => FirebaseAuthProvider(),
        ),
        ChangeNotifierProvider<CarouselIndicatorProvider>(
          create: (_) => CarouselIndicatorProvider(),
        ),
        ChangeNotifierProvider<AccountControllerProvider>(
          create: (_) => AccountControllerProvider(),
        ),
        ChangeNotifierProvider<QuickLinkControllerProvider>(
          create: (_) => QuickLinkControllerProvider(),
        ),
        ChangeNotifierProvider<ClubSearchOption>(
          create: (_) => ClubSearchOption(),
        ),
        ChangeNotifierProvider<TimerSettingProvider>(
          create: (_) => TimerSettingProvider(),
        ),
        ChangeNotifierProvider<NoticeSelectorProvider>(
          create: (_) => NoticeSelectorProvider(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MainBottomTabNavScreen(),
          '/signform': (context) => SignFormScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/feature/busInfo': (context) => BusInfoScreen(),
          '/feature/clubChannel': (context) => ClubChannelScreen(),
          '/feature/cukcatTimer': (context) => CukCatTimerScreen(),
          '/help': (context) => HelpScreen(),
        },
        theme: ThemeData(
          fontFamily: "NanumSquareRegular",
          backgroundColor: Colors.white,
          primaryColor: Color(0XFF4C7DE1),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Color(0XFF4C7DE1)),
            textTheme: TextTheme(
              title: TextStyle(
                color: Color(0XFF4C7DE1),
                fontFamily: "NanumSquareExtraBold",
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

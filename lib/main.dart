import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friendzy/screens/sign_in_page.dart';
import 'package:friendzy/utility/constants/size_config.dart';
import 'package:friendzy/utility/theme/theme.dart';
import 'package:friendzy/view_Models/user_settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserSettingsProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      title: 'Friendzy, A dating app',
      theme: context.watch<UserSettingsProvider>().isLightMode
          ? TAppTheme.lightTheme
          : TAppTheme.darkTheme,
      home: const SignInPage(),
    );
  }
}

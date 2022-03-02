import 'package:com_nico_develop_relax/screens/settings/payment_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ÔKalm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 22.0,
            height: 1.3,
          ),
          subtitle1: TextStyle(
            fontSize: 18.0,
            height: 3,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
            fontSize: 18.0,
            height: 3,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            fontSize: 18.0,
            height: 1.5,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      home: const PaymentScreen(),
      // home: LayoutBuilder(builder: (context, constraints) {
      //   final double height = MediaQuery.of(context).size.height;

      //   return HomeScreen(
      //     height: height,
      //   );
      // }),
    );
  }
}

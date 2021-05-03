import 'package:fastkash/bloc/app_bloc.dart';
import 'package:fastkash/bloc/bloc.dart';
import 'package:fastkash/config/route.dart';
import 'package:fastkash/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FastKashApp extends StatefulWidget {
  @override
  _FastKashAppState createState() => _FastKashAppState();
}

class _FastKashAppState extends State<FastKashApp> {

  final routes = Routes();

  @override
  void initState() {
    super.initState();
    AppBloc.applicationBloc.add(ApplicationStartupEvent());
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
        providers: AppBloc.blocProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routes.generateRoute,
          theme: ThemeData(
            primaryColor: Colors.white,
            platform: TargetPlatform.iOS,
            appBarTheme: AppBarTheme(color: Colors.white),
            fontFamily: 'PopBlack',
          ),
          home: BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
              if (state is ApplicationSetupState) return MainScreen();
              return SplashScreen();
            },
          ),
        )
    );
  }
}

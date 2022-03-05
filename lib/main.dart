import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/home_layout.dart';
import 'package:shop_app/modules/on_boarding_screen/on_boardin_screen.dart';
import 'package:shop_app/modules/settings/profile_screen.dart';
import 'package:shop_app/shared/cubit/app_cubit.dart';
import 'package:shop_app/shared/cubit/app_states.dart';
import 'package:shop_app/shared/network/local/cached_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/themes/dark_theme.dart';
import 'package:shop_app/shared/style/themes/light_theme.dart';
import 'modules/login/login_screen.dart';
import 'modules/settings/doctorsCategories.dart';
import 'modules/settings/list_of_doctors.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'shared/componnet/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashedHelper.init();

  bool isDark = CashedHelper.getData(key: 'isDark');
  Widget widget;
  bool onBoarding = CashedHelper.getData(key: 'onBoarding');
  token = CashedHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else
      widget = ShopLoginScreen();
  } else
    widget = OnBoardingScreen();
  print(onBoarding);

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp({this.isDark, this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()
              ..geTUserData()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: !AppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/app_states.dart';
import 'package:shop_app/shared/network/local/cached_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(ShopAppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  // to change app themeMode
  bool isDark = true;
  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      CashedHelper.putBoolean(key: 'isDark', isDark: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}

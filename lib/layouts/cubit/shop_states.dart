import 'package:shop_app/models/favorites_model/change_favorites_model.dart';
import 'package:shop_app/models/login_model/login_model.dart';

abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;
  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoryState extends ShopStates {}

class ShopErrorCategoryState extends ShopStates {
  final String error;
  ShopErrorCategoryState(this.error);
}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavoritesModel model;
  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;
  ShopErrorChangeFavoritesState(this.error);
}

class ShopLoadingGetFavProductsState extends ShopStates {}

class ShopSuccessGetFavProductsState extends ShopStates {}

class ShopErrorGetFavProductsState extends ShopStates {
  final String error;
  ShopErrorGetFavProductsState(this.error);
}

class ShopSuccessGetUserDataState extends ShopStates {
  final ShopLoginModel loginModel;
  ShopSuccessGetUserDataState(this.loginModel);
}

class ShopErrorGetUserDataState extends ShopStates {
  final String error;
  ShopErrorGetUserDataState(this.error);
}
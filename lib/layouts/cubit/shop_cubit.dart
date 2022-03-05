import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/models/categories/categories_model.dart';
import 'package:shop_app/models/favorites_model/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model/favorites_item_model.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/models/login_model/login_model.dart';
import 'package:shop_app/modules/catergories/categories_screen.dart';
import 'package:shop_app/modules/favourites/favoruites_screen.dart';
import 'package:shop_app/modules/products/product_screen.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/componnet/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());

  ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen()
  ];

    List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.apps_rounded,
        ),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.solidHeart,
        ),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.cog,
        ),
        label: 'Settings',
      ),
    ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;
  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      //  print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error));
      //  print(error.toString());
    });
  }

  CategoriesModel categoriesModel;
  void getCategories() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print(categoriesModel.data.data[0].name);
      emit(ShopSuccessCategoryState());
    }).catchError((error) {
      emit(ShopErrorCategoryState(error));
      //print(error.toString());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId];
    emit(ShopChangeFavoritesState());
    DioHelper.postData(
            url: FAVORITES,
            data: {
              'product_id': productId,
            },
            token: token)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      //print(value.data);
      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];
      emit(ShopErrorChangeFavoritesState(error));
    });
  }

  FavoritesModel favoritesModel;
  void getFavorites() {
    emit(ShopLoadingGetFavProductsState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //print(value.data.toString());
      emit(ShopSuccessGetFavProductsState());
    }).catchError((error) {
      emit(ShopErrorGetFavProductsState(error));
     // print(error.toString());
    });
  }

  ShopLoginModel userModel;
  void geTUserData() {
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(value.data.toString());
      emit(ShopSuccessGetUserDataState(userModel));
    }).catchError((error) {
      emit(ShopErrorGetUserDataState(error));
      print(error.toString());
    });
  }

}

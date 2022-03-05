import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            title: Text(
              "Shoppy",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(FontAwesomeIcons.search),
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  }),
              IconButton(
                  icon: Icon(FontAwesomeIcons.signOutAlt),
                  onPressed: () {
                    signOut(context);
                  }),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (int index) {
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}

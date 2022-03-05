import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/layouts/home_layout.dart';
import 'package:shop_app/models/categories/categories_model.dart';
import 'package:shop_app/shared/componnet/component.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit().get(context);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, int index) => buildCategoryItem(
              context, cubit.categoriesModel.data.data[index]),
          separatorBuilder: (context, int index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: myDivider(),
          ),
          itemCount: cubit.categoriesModel.data.data.length,
        );
      },
    );
  }

  Widget buildCategoryItem(context, DataModel model) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Image(
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                    image: NetworkImage(model.image)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${model.name.toUpperCase()}",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {})
              ],
            ),
          ),
        ),
      );
}

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/models/favorites_model/favorites_item_model.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit().get(context);
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavProductsState,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildFavItem(context, cubit.favoritesModel.data.data[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: cubit.favoritesModel.data.data.length),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildFavItem(context, FavoritesData model) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Container(
              width: double.infinity,
              height: 120,
              child: Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image(
                        // color: Colors.amber,
                        image: NetworkImage(model.product.image),
                        fit: BoxFit.contain,
                        width: 150,
                        height: 150,
                      ),
                      if (model.product.discount != 0)
                        Container(
                          decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              "DISCOUNT",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${model.product.name}",
                          style: Theme.of(context).textTheme.overline.copyWith(
                                height: 1.3,
                                fontSize: 14,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${model.product.price} LE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .copyWith(
                                        color: redColor,
                                        fontSize: 16,
                                      ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                if (model.product.discount != 0)
                                  Text(
                                    '${model.product.oldPrice} LE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        .copyWith(
                                            fontSize: 12,
                                            color: redColor.withOpacity(0.5),
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                              ],
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: redColor,
                                child: ShopCubit()
                                        .get(context)
                                        .favorites[model.product.id]
                                    ? Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        FontAwesomeIcons.heart,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                              ),
                              onPressed: () {
                                ShopCubit()
                                    .get(context)
                                    .changeFavorites(model.product.id);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

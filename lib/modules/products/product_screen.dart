import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/models/categories/categories_model.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if (state is ShopSuccessChangeFavoritesState) {
            if (!state.model.status) {
              showToast(
                message: state.model.message,
                state: ToastStates.ERROR,
              );
            } else if (state.model.status == true) {
              showToast(
                message: state.model.message,
                state: ToastStates.SUCCESS,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopCubit().get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel != null && cubit.categoriesModel != null,
            builder: (context) =>
                productBuilder(cubit.homeModel, cubit.categoriesModel, context),
            fallback: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget productBuilder(
          HomeModel homeModel, CategoriesModel categoriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: homeModel.data.banners
                    .map((element) => ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: NetworkImage(element.image),
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 220,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  reverse: false,
                  viewportFraction: 0.95,
                  scrollPhysics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.easeOutSine,
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  myDivider(),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(categoriesModel.data.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.0,
                      ),
                      itemCount: categoriesModel.data.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  myDivider(),
                ],
              ),
            ),
            Container(
              // color: lightBlueColor.withOpacity(0.3),
              child: GridView.count(
                childAspectRatio: 1 / 1.3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children:
                    List.generate(homeModel.data.products.length, (index) {
                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      duration: const Duration(milliseconds: 375),
                      child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: buildProductItem(
                                  homeModel.data.products[index], context))));
                }),
              ),
            )
          ],
        ),
      );

  Widget buildProductItem(ProductModel productModel, context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                // color: Colors.amber,
                image: NetworkImage(productModel.image),
                fit: BoxFit.contain,
                width: double.infinity,
                height: 150,
              ),
              // if product has discount
              ConditionalBuilder(
                  condition: productModel.discount != 0,
                  builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 6.0,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: redColor,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 4.0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                "DISCOUNT",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ))
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 8,
              start: 12,
              end: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  style: TextStyle(height: 1.3, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${productModel.price.round()} LE',
                          style: TextStyle(fontSize: 12, color: redColor),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        if (productModel.discount != 0)
                          Text(
                            '${productModel.oldPrice.round()} LE',
                            style: TextStyle(
                                fontSize: 10,
                                color: redColor.withOpacity(0.5),
                                decoration: TextDecoration.lineThrough),
                          ),
                      ],
                    ),
                    IconButton(
                      icon: CircleAvatar(
                        radius: 18.0,
                        backgroundColor:
                            ShopCubit().get(context).favorites[productModel.id]
                                ? redColor
                                :  Colors.blueAccent[100],
                        child:
                            ShopCubit().get(context).favorites[productModel.id]
                                ? Icon(
                                    Icons.favorite_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.favorite_border_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                      ),
                      onPressed: () {
                        ShopCubit()
                            .get(context)
                            .changeFavorites(productModel.id);
                        print(productModel.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(DataModel model) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 100.0,
            width: 100.0,
            fit: BoxFit.contain,
          ),
          Container(
            decoration: BoxDecoration(
                color: blueBlackColor.withOpacity(0.8),
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12.0))),
            height: 25,
            width: double.infinity,
            child: Text(
              "${model.name}",
              style: TextStyle(fontSize: 13, color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

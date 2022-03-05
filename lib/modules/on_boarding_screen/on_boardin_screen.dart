import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/boarding_model/boarding_model.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';
import 'package:shop_app/shared/cubit/app_cubit.dart';
import 'package:shop_app/shared/cubit/app_states.dart';
import 'package:shop_app/shared/network/local/cached_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        imageUrl: "assets/images/onboard_1.jpg",
        title: "On boarding title 1",
        body: "On boarding body 1"),
    BoardingModel(
        imageUrl: "assets/images/onboard_1.jpg",
        title: "On boarding title 2",
        body: "On boarding body 2"),
    BoardingModel(
        imageUrl: "assets/images/onboard_1.jpg",
        title: "On boarding title 3",
        body: "On boarding body 3"),
  ];

  var boardController = PageController();

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(actions: [
            defaultTextButton(
              context: context,
              labelText: Text("Skip",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(color: blueBlackColor)),
              onPressed: submit,
            )
          ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                          dotColor: primaryColor,
                          radius: 6,
                          activeDotColor: blueBlackColor,
                          expansionFactor: 2.0,
                          spacing: 6.0,
                          offset: 16.0,
                          dotHeight: 10,
                          dotWidth: 10),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast == true) {
                          submit();
                        } else {
                          boardController.nextPage(
                              duration: Duration(milliseconds: 450),
                              curve: Curves.decelerate);
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                      elevation: 4.0,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBoardingItem(BoardingModel boardingModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(boardingModel.imageUrl),
            ),
          ),
          Text(
            boardingModel.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            boardingModel.body,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60.0,
          ),
        ],
      );

  void submit() {
    CashedHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}

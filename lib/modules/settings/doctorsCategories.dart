import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/modules/settings/cateModel.dart';
import 'package:shop_app/modules/settings/profile_screen.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';

import 'list_of_doctors.dart';

class DoctorsCategories extends StatelessWidget {
  List<CatModel> catModel = [
    CatModel(catName: "اسنــــــــان", catIcon: FontAwesomeIcons.teethOpen),
    CatModel(catName: "جلـــــــدية", catIcon: FontAwesomeIcons.allergies),
    CatModel(catName: "مخ و أعصاب", catIcon: FontAwesomeIcons.brain),
    CatModel(catName: "أطفــــــــال", catIcon: FontAwesomeIcons.child),
    CatModel(catName: "عظـــــــــام", catIcon: FontAwesomeIcons.bone),
    CatModel(catName: "نساء و توليد", catIcon: Icons.pregnant_woman_rounded),
    CatModel(catName: "أنف و أذن", catIcon: FontAwesomeIcons.headSideCough),
    CatModel(catName: "قلـب و أوعية دموية", catIcon: FontAwesomeIcons.heartbeat),
    CatModel(catName: "أطفــــــــال", catIcon: FontAwesomeIcons.child),
    CatModel(catName: "عظـــــــــام", catIcon: FontAwesomeIcons.bone),
    CatModel(catName: "نساء و توليد", catIcon: Icons.pregnant_woman_rounded),
    CatModel(catName: "أنف و أذن", catIcon: FontAwesomeIcons.headSideCough),
    CatModel(catName: "قلـب و أوعية دموية", catIcon: FontAwesomeIcons.heartbeat),
    CatModel(catName: "قلـب و أوعية دموية", catIcon: FontAwesomeIcons.heartbeat),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(160))),
                backgroundColor: Colors.blue[700],
                title: Center(
                  child: Text(
                    "اختر التخـــــــــــــــــــــصص",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 20
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // color: lightBlueColor.withOpacity(0.3),
                                  child: GridView.count(
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 25,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    children:
                                    List.generate(catModel.length, (index) {
                                      return AnimationConfiguration.staggeredGrid(
                                          position: index,
                                          columnCount: 2,
                                          duration: const Duration(milliseconds: 375),
                                          child: ScaleAnimation(
                                              child: FadeInAnimation(
                                                  child: buildCatItem(
                                                      catModel[index], context))));
                                    }),
                                  ),
                                )
                              ]))
                    ])),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.cog,
                ),
                label: 'الاعدادات',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.virus,
                ),
                label: 'كورونا',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.userMd,
                ),
                label: 'اختر دكتور',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.hospital,
                ),
                label: 'مستشفي',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.home,
                ),
                label: 'الرئيسية',
              ),
            ],
          ),));
  }

  Widget buildCatItem(CatModel catModel, context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, ListOfDoctors(
          catName: catModel.catName,
        ));
        },
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
                colors: [Colors.blue[200],Colors.blue[500], Colors.blue[700]])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              catModel.catIcon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text("${catModel.catName}",
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
              fontSize: 30,
              height: 1.2,
              letterSpacing: 2,
              color: Colors.white
            ),
            )
          ],
        ),
      ),
    );
  }
}

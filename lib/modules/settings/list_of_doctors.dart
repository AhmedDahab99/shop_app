import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/modules/settings/cateModel.dart';
import 'package:shop_app/modules/settings/doctorsModel.dart';
import 'package:shop_app/modules/settings/profile_screen.dart';
import 'package:shop_app/shared/componnet/component.dart';

class ListOfDoctors extends StatelessWidget {
  List<DoctorsModel> doctorsModel = [
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/doctor_PNG16041.png",
        name: "د/ محمود صبري صالح",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 50,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "شارع الجيش",
        city: "منوف",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image:
            "https://cdn.picpng.com/doctors_and_nurses/icon-doctors-and-nurses-32725.png",
        name: "د/ محمد شكري الحارون",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 500,
        price: 80,
        phone: 15035,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "ميدان شرف",
        city: "شبين الكوم",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/doctor_PNG16019.png",
        name: "د/ محمود عبدالرازق",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4 / 5",
        numOfPatients: 300,
        price: 120,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "ميدان شرف",
        city: "شبين الكوم",
        day: "السبت - الجمعة",
        time: "من الساعة 4 عصراً"),
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/doctor_PNG16020.png",
        name: "د/ مروة ماضي",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 85,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "شارع كلية الطب",
        city: "شبين الكوم",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/small/doctor_PNG16038.png",
        name: "د/ أميرة البكري",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 110,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "شارع البرقي",
        city: "بركةالسبع",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/doctor_PNG16018.png",
        name: "د/ هاني ابراهيم مطاوع",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 50,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "السوق التجاري المنطقة الرابعة",
        city: "السادات",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
    DoctorsModel(
        image: "https://pngimg.com/uploads/doctor/small/doctor_PNG16022.png",
        name: "د/ تامر الاشقر",
        job: "أخصائي طب الأطفال و حديثي الولادة",
        rate: "4.5 / 5",
        numOfPatients: 300,
        price: 50,
        phone: 16777,
        info:
            " عضو الجمعية المصرية لطب الأطفال د. الزمالة البريطانية لطب الأطفال. دكتور اطفال وحديثي الولادة متخصص في اطفال و حديثي الولادة",
        address: "امام موقف شبين",
        city: "قويسنا",
        day: "السبت - الجمعة",
        time: "من الساعة 1 ظهراً"),
  ];
  final String catName;
  ListOfDoctors({
    @required this.catName,
  });
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
                automaticallyImplyLeading: false,
                title: Center(
                  child: Text(
                    "$catName",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // color: lightBlueColor.withOpacity(0.3),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return buildCategoryItem(
                                            context, doctorsModel[index]);
                                      },
                                      itemCount: doctorsModel.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 20,
                                          )),
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
        ),
        ));
  }

  Widget buildCategoryItem(context, DoctorsModel model) => GestureDetector(
        onTap: () {
          navigateTo(context, ProfileScreen(
            rate: model.rate,
            job: model.job,
            address: model.address,
            city: model.city,
            price: model.price,
            numOfPatients: model.numOfPatients,
            phone: model.phone,
            name: model.name,
            info: model.info,
            time: model.time,
            image: model.image,
            day: model.day,
          ));
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.mirror,
                  colors: [Colors.white, Colors.white54, Colors.blue])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${model.name}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.job}",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          .copyWith(fontSize: 12, color: Colors.blue[900]),
                    ),
                    Row(
                      children: [
                        Text(
                          "${model.price} جنيهاً",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .overline
                              .copyWith(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "سعر الكشف: ",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .overline
                              .copyWith(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100].withOpacity(0),
                        borderRadius: BorderRadius.circular(12)),
                    width: 120,
                    height: 120,
                    child: Image(
                      image: NetworkImage("${model.image}"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

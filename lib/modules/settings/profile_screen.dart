import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/shared/componnet/constants.dart';
import 'doctorsModel.dart';

class ProfileScreen extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final dynamic rate;
  final int numOfPatients;
  final dynamic price;
  final int phone;
  final String info;
  final String address;
  final String city;
  final String day;
  final String time;

  const ProfileScreen({@required this.image,
    @required this.name,
    @required this.job,
    @required this.rate,
    @required this.numOfPatients,
    @required this.price,
    @required this.phone,
    @required this.info,
    @required this.address,
    @required this.city,
    @required this.day,
    @required this.time});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                   width: width,
                    height: height/5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(180)),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.blue[700], BlendMode.overlay),
                        image: NetworkImage(
                            "https://www.propediatrics.com/images/Doctor-Examining-Child(1).jpg"),
                        fit: BoxFit.cover,),),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.2,
                        sigmaY: 1,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100].withOpacity(0.2),
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(180)),
                      ),))),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[700].withOpacity(0.8),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        iconSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // doctor name
                              Text(
                                name,
                                style: TextStyle(fontSize: 18),
                                textScaleFactor: 0.8,
                                textDirection: TextDirection.rtl,
                              ),
                              // job
                              Text(
                                job,
                                textDirection: TextDirection.rtl,
                                maxLines: 2,
                                textScaleFactor: .8,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue[700]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: Column(
                                  children: [
                                    // rating
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "التقيـــــــم",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: blueBlackColor
                                                      .withOpacity(0.4)),
                                            ),
                                            Text(
                                              rate,
                                              textDirection:
                                                  TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: blueBlackColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.star,
                                            color: Colors.blue[300],
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.blue[300],
                                    ),
                                    // number of patients
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "عدد المرضي",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: blueBlackColor
                                                      .withOpacity(0.4)),
                                            ),
                                            Text(
                                              numOfPatients.toString(),
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: blueBlackColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.userAlt,
                                            color: Colors.blue[300],
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.blue[300],
                                    ),
                                    // price
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "الكشف",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: blueBlackColor
                                                      .withOpacity(0.4)),
                                            ),
                                            Text(
                                             price.toString(),
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: blueBlackColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.moneyBillWave,
                                            color: Colors.blue[300],
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.blue[300],
                                    ),
                                    // phone
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "رقم العيادة",
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: blueBlackColor
                                                      .withOpacity(0.4)),
                                            ),
                                            Text(
                                             phone.toString(),
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: blueBlackColor),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.phone,
                                            color: Colors.blue[300],
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(12)),
                            width: width / 2.2,
                            height: height / 3,
                            child: Image(
                              image: NetworkImage(
                                 image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // map
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // bio
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "معلومات عن الدكتور",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.info,
                                      color: Colors.blue[300],
                                      size: 40,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                               info,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[300],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "العنوان",
                                    textDirection:
                                    TextDirection.rtl,
                                    style:
                                    TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    address,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    maxLines: 2,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue[700]),
                                  ),
                                  Text(
                                    city,
                                    textDirection:
                                    TextDirection.rtl,
                                    textScaleFactor:1,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[300]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.blue[300],
                                  size: 50,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "المواعيد",
                                    textDirection:
                                    TextDirection.rtl,
                                    style:
                                    TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    day,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    maxLines: 2,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue[700]),
                                  ),
                                  Text(
                                    time,
                                    textDirection:
                                    TextDirection.rtl,
                                    textScaleFactor:1,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue[300]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.blue[300],
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.blue[300],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                  "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
                              fit: BoxFit.cover,
                              width: width,
                              height: height / 4.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
      ),
    );
  }
}
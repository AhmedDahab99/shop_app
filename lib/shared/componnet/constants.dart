import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/network/local/cached_helper.dart';

Color primaryColor = Color(0xffb4a5a5);
Color blueBlackColor = Color(0xff150e56);
Color redColor = Color(0xffce1212);
Color lightBlueColor = Color(0xff1dd0dd);
Color backgroundColor = Color(0xff151515);
TextStyle darkLabelStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 1.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
TextStyle lightLabelStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 1.0,
  fontWeight: FontWeight.w500,
  color: primaryColor,
);

void signOut(context){
  CashedHelper.removeData(key: 'token').then((value){
    if(value){
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String token ='';
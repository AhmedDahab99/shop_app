import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/shared/componnet/constants.dart';

Widget defaultTextFormField(
        {@required TextEditingController controller,
        InputDecoration inputDecoration,
        @required String labelText,
        TextStyle labelStyle,
        @required IconData prefixIcon,
        Color prefixIconColor,
        Color suffixIconColor,
        OutlineInputBorder focusOutlineInputBorder,
        OutlineInputBorder enableOutlineInputBorder,
        TextStyle inputStyle,
        IconData suffixIcon,
        TextInputType keyboardType,
        @required Function validator,
        bool isPassword = false,
        Function suffixPressed,
        Function onSubmitted,
        Function onChanged,
        Function onTap,
        bool isClickable = true}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: blueBlackColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: blueBlackColor.withOpacity(0.6),
            ),
          ),
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                    color: suffixIconColor,
                  ))
              : null,
          contentPadding: EdgeInsets.all(16.0)),
      style: inputStyle,
      obscureText: isPassword ? true : false,
      keyboardType: keyboardType,
      enabled: isClickable,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: onTap,
    );

Widget defaultButton(
        {double width = double.infinity,
          double height = 45,
              Color backgroundColor = Colors.white,
        Color labelColor = Colors.black,
        double radius = 0.0,
        @required Function onPressedFun,
        @required String labelText,
        TextStyle labelStyle,
        bool isUpperCase = true}) =>
    Container(
      width: width,
      height: height,
      child: CupertinoButton(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          pressedOpacity: 0.8,
          child: Text(
            isUpperCase ? labelText.toUpperCase() : labelText,
            style: labelStyle,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          onPressed: onPressedFun),
    );

Widget defaultTextButton({
  context,
  @required Function onPressed,
  @required Text labelText,
}) =>
    TextButton(
      onPressed: onPressed,
      child: labelText,
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

Widget defaultDivider() => Divider(
      height: 1,
      thickness: 2,
      color: primaryColor,
      indent: 1.0,
      endIndent: 10.0,
    );

Widget defaultSocialIcon(
        {@required IconData socialIcon,
        @required Color backgroundColor,
        @required Color iconColor,
        @required Function onPressed}) =>
    Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(16.0)),
        width: 40,
        height: 40,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              socialIcon,
              color: iconColor,
            )));

void showToast({
  @required String message,
  @required ToastStates state,
  context
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 18.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget myDivider() => Divider(
  color: blueBlackColor.withOpacity(0.6),
);

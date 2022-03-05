import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/home_layout.dart';
import 'package:shop_app/modules/login/cubit/loginCubit.dart';
import 'package:shop_app/modules/login/cubit/loginStates.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/register/cubit/registerCubit.dart';
import 'package:shop_app/modules/register/cubit/registerStates.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';
import 'package:shop_app/shared/network/local/cached_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state){
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status) {
              CashedHelper.saveData(
                  key: 'token', value: state.loginModel.data.token).then((value){
                token = state.loginModel.data.token;
                navigateAndFinish(context, HomeLayout());
              });
              showToast(
                message: state.loginModel.message,
                state: ToastStates.SUCCESS,
              );
              // print(state.loginModel.message);
              // print(state.loginModel.data.token);
            } else {
              // print(state.loginModel.message);
              showToast(
                message: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state){
          var cubit = ShopRegisterCubit.get(context);
          return  SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Icon(
                                FontAwesomeIcons.shoppingCart,
                                size: 100,
                                color: blueBlackColor,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Register",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Text(
                            "Register Now To Browse Our Offers",
                            style: Theme.of(context).textTheme.overline.copyWith(
                                color: blueBlackColor.withOpacity(0.6),
                                letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
// name
                          defaultTextFormField(
                              controller: nameController,
                              labelText: "Username",
                              inputStyle: Theme.of(context).textTheme.overline,
                              prefixIconColor: blueBlackColor,
                              keyboardType: TextInputType.name,
                              prefixIcon: Icons.person,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your name";
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
// phone
                          defaultTextFormField(
                              controller: phoneController,
                              labelText: "Phone Number",
                              inputStyle: Theme.of(context).textTheme.overline,
                              prefixIconColor: blueBlackColor,
                              keyboardType: TextInputType.phone,
                              prefixIcon: Icons.phone,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your phone";
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
// email
                          defaultTextFormField(
                              controller: emailController,
                              labelText: "Email Address",
                              inputStyle: Theme.of(context).textTheme.overline,
                              prefixIconColor: blueBlackColor,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.alternate_email_rounded,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your email";
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
// password
                          defaultTextFormField(
                              isPassword: cubit.isPassword,
                              controller: passwordController,
                              labelText: "Password",
                              inputStyle: Theme.of(context).textTheme.overline,
                              prefixIconColor: blueBlackColor,
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              suffixIcon: cubit.icon,
                              suffixIconColor: blueBlackColor,
                              suffixPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "please enter your password";
                                }
                              }),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     TextButton(
                          //       onPressed: () {},
                          //       child: Text(
                          //         "Remember Me",
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .overline
                          //             .copyWith(
                          //                 fontSize: 14,
                          //                 color: blueBlackColor.withOpacity(0.8)),
                          //       ),
                          //     ),
                          //     TextButton(
                          //       onPressed: () {},
                          //       child: Text(
                          //         "Forgot Password?",
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .overline
                          //             .copyWith(
                          //                 fontSize: 14,
                          //                 color: blueBlackColor.withOpacity(0.5)),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 20.0,
                          ),
// login btn
                          Center(
                            child: ConditionalBuilder(
                              condition:state is! ShopRegisterLoadingState,
                              builder: (context) => Stack(
                                children: [
                                  defaultButton(
                                    height: 55,
                                    onPressedFun: () {
                                      if (formKey.currentState.validate()) {
                                        cubit.userRegister(
                                            name: nameController.text,
                                            phone: phoneController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    labelText: "Register",
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .overline
                                        .copyWith(color: Colors.white, fontSize: 22),
                                    radius: 30,
                                    backgroundColor: blueBlackColor,
                                    labelColor: Colors.white,
                                    isUpperCase: true,
                                  ),
                                  Positioned(
                                      bottom: 5,
                                      top: 5,
                                      right: 30,
                                      child: Icon(
                                        FontAwesomeIcons.signInAlt,
                                        size: 35,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultDivider(),
                          SizedBox(
                            height: 20.0,
                          ),
//Or Login With
                          Center(
                            child: Text(
                              "Or Register With",
                              style: Theme.of(context).textTheme.overline.copyWith(
                                  color: blueBlackColor.withOpacity(0.6),
                                  letterSpacing: 2),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
// social icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultSocialIcon(
                                  backgroundColor: blueBlackColor,
                                  socialIcon: FontAwesomeIcons.facebookF,
                                  iconColor: Colors.white,
                                  onPressed: () {}),
                              SizedBox(
                                width: 22.0,
                              ),
                              defaultSocialIcon(
                                  backgroundColor: lightBlueColor,
                                  socialIcon: FontAwesomeIcons.twitter,
                                  iconColor: Colors.white,
                                  onPressed: () {}),
                              SizedBox(
                                width: 22.0,
                              ),
                              defaultSocialIcon(
                                  backgroundColor: redColor,
                                  socialIcon: FontAwesomeIcons.google,
                                  iconColor: Colors.white,
                                  onPressed: () {}),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
//Or Login With
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already Have An Account?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .copyWith(
                                      color: blueBlackColor.withOpacity(0.6)),
                                ),
                                defaultTextButton(
                                    context: context,
                                    labelText: Text("Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline
                                            .copyWith(color: blueBlackColor)),
                                    onPressed: () {
                                      navigateTo(context, ShopRegisterScreen());
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
// SafeArea(
// child: Scaffold(
// body: SingleChildScrollView(
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
// child: Center(
// child: Form(
// key: formKey,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: 20.0,
// ),
// Center(
// child: Icon(
// FontAwesomeIcons.shoppingCart,
// size: 100,
// color: blueBlackColor,
// )),
// SizedBox(
// height: 20.0,
// ),
// Text(
// "SignUp",
// style: Theme.of(context).textTheme.headline3,
// ),
// Text(
// "SignUp Now To Browse Our Offers",
// style: Theme.of(context).textTheme.overline.copyWith(
// color: blueBlackColor.withOpacity(0.6), letterSpacing: 2),
// ),
// SizedBox(
// height: 20,
// ),
// // name
// defaultTextFormField(
// controller: nameController,
// labelText: "Username",
// inputStyle: Theme.of(context).textTheme.overline,
// prefixIconColor: blueBlackColor,
// keyboardType: TextInputType.name,
// prefixIcon: Icons.person,
// validator: (String value) {
// if (value.isEmpty) {
// return "Please enter your name";
// }
// }),
// SizedBox(
// height: 16.0,
// ),
// // phone
// defaultTextFormField(
// controller: phoneController,
// labelText: "Password",
// inputStyle: Theme.of(context).textTheme.overline,
// prefixIcon: Icons.phone,
// prefixIconColor: blueBlackColor,
// keyboardType: TextInputType.phone,
// validator: (String value) {
// if (value.isEmpty) {
// return "please enter your phone";
// }
// }),
// SizedBox(
// height: 16.0,
// ),
// // email
// defaultTextFormField(
// isPassword: true,
// controller: emailController,
// labelText: "Email Address",
// inputStyle: Theme.of(context).textTheme.overline,
// prefixIconColor: blueBlackColor,
// keyboardType: TextInputType.emailAddress,
// prefixIcon: Icons.alternate_email_rounded,
// validator: (String value) {
// if (value.isEmpty) {
// return "Please enter your Email";
// }
// }),
// SizedBox(
// height: 16.0,
// ),
// // password
// defaultTextFormField(
// isPassword: true,
// controller: passwordController,
// labelText: "Password",
// inputStyle: Theme.of(context).textTheme.overline,
// prefixIconColor: blueBlackColor,
// keyboardType: TextInputType.visiblePassword,
// prefixIcon: Icons.lock,
// suffixIcon: Icons.remove_red_eye,
// suffixIconColor: blueBlackColor,
// suffixPressed: () {},
// validator: (String value) {
// if (value.isEmpty) {
// return "please enter your password";
// }
// }),
// SizedBox(
// height: 16.0,
// ),
// SizedBox(
// height: 16.0,
// ),
// // login btn
// Center(
// child: defaultButton(
// onPressedFun: () {
//
// },
// labelText: "SignUp",
// labelStyle: Theme.of(context)
// .textTheme
//     .overline
//     .copyWith(color: Colors.white, fontSize: 18),
// radius: 30,
// backgroundColor: blueBlackColor,
// labelColor: Colors.white,
// isUpperCase: true,
// width: MediaQuery.of(context).size.width * 0.6),
// ),
// SizedBox(
// height: 16.0,
// ),
// defaultDivider(),
// SizedBox(
// height: 12.0,
// ),
// //Or Login With
// Center(
// child: Text(
// "Or SignUp With",
// style: Theme.of(context).textTheme.overline.copyWith(
// color: blueBlackColor.withOpacity(0.6),
// letterSpacing: 2),
// ),
// ),
// SizedBox(
// height: 6.0,
// ),
// // social icons
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// defaultSocialIcon(
// backgroundColor: blueBlackColor,
// socialIcon: FontAwesomeIcons.facebookF,
// iconColor: Colors.white,
// onPressed: () {}),
// SizedBox(
// width: 22.0,
// ),
// defaultSocialIcon(
// backgroundColor: lightBlueColor,
// socialIcon: FontAwesomeIcons.twitter,
// iconColor: Colors.white,
// onPressed: () {}),
// SizedBox(
// width: 22.0,
// ),
// defaultSocialIcon(
// backgroundColor: redColor,
// socialIcon: FontAwesomeIcons.google,
// iconColor: Colors.white,
// onPressed: () {}),
// ],
// ),
// SizedBox(
// height: 12.0,
// ),
// //Or Login With
// Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Already Have An Account",
// style: Theme.of(context)
// .textTheme
//     .overline
//     .copyWith(color: blueBlackColor.withOpacity(0.6)),
// ),
// defaultTextButton(
// context: context,
// labelText: Text("Login",
// style: Theme.of(context)
// .textTheme
//     .overline
//     .copyWith(color: blueBlackColor)),
// onPressed: () {
// navigateTo(context, ShopLoginScreen());
// })
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ),
// ),
// );

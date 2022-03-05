import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layouts/cubit/shop_cubit.dart';
import 'package:shop_app/layouts/cubit/shop_states.dart';
import 'package:shop_app/shared/componnet/component.dart';
import 'package:shop_app/shared/componnet/constants.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessGetUserDataState) {
          nameController.text = state.loginModel.data.name;
          nameController.text = state.loginModel.data.phone;
          nameController.text = state.loginModel.data.email;
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit().get(context).userModel;
        nameController.text = cubit.data.name;
        phoneController.text = cubit.data.phone;
        emailController.text = cubit.data.email;
        return ConditionalBuilder(
          condition: cubit != null,
          builder: (context) {
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //user name
                  defaultTextFormField(
                      controller: nameController,
                      labelText: "Name",
                      inputStyle: Theme.of(context).textTheme.overline,
                      prefixIconColor: blueBlackColor,
                      keyboardType: TextInputType.name,
                      prefixIcon: FontAwesomeIcons.userAlt,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Name Must Be Not Empty";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  // user phone
                  defaultTextFormField(
                      controller: phoneController,
                      labelText: "Phone",
                      inputStyle: Theme.of(context).textTheme.overline,
                      prefixIconColor: blueBlackColor,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_android_rounded,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Phone Must Be Not Empty";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  // user email
                  defaultTextFormField(
                      controller: emailController,
                      labelText: "Email Address",
                      inputStyle: Theme.of(context).textTheme.overline,
                      prefixIconColor: blueBlackColor,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.alternate_email_rounded,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email Must Be Not Empty";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      onPressedFun: (){
                        signOut(context);
                      },
                      labelText: "Logout",
                      isUpperCase: true,
                    backgroundColor: redColor,
                    width: 150
                  ),
                ],
              ),
            ),
          );
          },
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            strokeWidth: 5,
          )),
        );
      },
    );
  }
}


// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(30),
// child: Container(
// decoration: BoxDecoration(
// color: Colors.blue[100],
// borderRadius: BorderRadius.circular(12)),
// width: width/2.5,
// height: height/2.8,
// child: Image(
// image: NetworkImage(
// "https://pngimg.com/uploads/doctor/doctor_PNG15988.png"),
// fit: BoxFit.cover,
// width: 150,
// height: 300,
// ),
// ),
// ),
// SizedBox(width: 20,),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// // doctor name
// Text(
// "Dr/ John Mikel",
// style: TextStyle(fontSize: 18),
// textScaleFactor: 0.8,
// ),
// // job
// Text(
// "Heart Surgeon Specialist",
// textScaleFactor: 0.7,
// style: TextStyle(
// fontSize: 18,
// color: blueBlackColor.withOpacity(0.4)),
// ),
// SizedBox(
// height: 20,
// ),
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30)
// ),
// elevation:3,
// margin: EdgeInsets.zero,
// shadowColor: Colors.black38,
// color: Colors.white,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// // rating
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// IconButton(
// icon: Icon(
// Icons.star_rate_rounded,
// color: blueBlackColor,
// size: 30,
// ),
// onPressed: () {},
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Rating",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor.withOpacity(0.4)),),
// Text("4.5 Out of 5",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor),),
// ],
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// // number of patients
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// IconButton(
// icon: Icon(
// FontAwesomeIcons.userAlt,
// color: redColor,
// size: 25,
// ),
// onPressed: () {},
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Patients",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor.withOpacity(0.4)),),
// Text("1000+",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor),),
// ],
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// // price
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// IconButton(
// icon: Icon(
// FontAwesomeIcons.dollarSign,
// color: blueBlackColor,
// size: 25,
// ),
// onPressed: () {},
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Disclosure Price",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor.withOpacity(0.4)),),
// Text("150 \$",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor),),
// ],
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// // phone
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// IconButton(
// icon: Icon(
// FontAwesomeIcons.phoneAlt,
// color: redColor,
// size: 25,
// ),
// onPressed: () {},
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Phone",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor.withOpacity(0.4)),),
// Text("167777",style: TextStyle(
// fontSize: 14,
// color: blueBlackColor),),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// )
// ],
// ),
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// // map
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 1),
// child: Column(
// children: [
// // bio
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Bio",
// style: TextStyle(fontSize: 20),
// ),
// Text(
// "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
// "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
// textAlign: TextAlign.left,
// style: TextStyle(
// fontSize: 13,
// color: Colors.redAccent[700].withOpacity(0.7),
// ),
// ),
// ],
// ),
// SizedBox(height: 10,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(20),
// child: Image(
// image: NetworkImage(
// "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
// fit: BoxFit.cover,
// width: 150,
// height: 200,
// ),
// ),
// SizedBox(
// width:10,
// ),
// Expanded(
// child: Column(
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// IconButton(
// icon: Icon(
// Icons.location_on_rounded,
// color: lightBlueColor,
// size: 25,
// ),
// onPressed: () {},
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Address",
// style: TextStyle(fontSize: 16),
// ),
// Text(
// "64 Park Avenue,",
// style: TextStyle(fontSize: 14,color: Colors.grey.withOpacity(0.8)),
// ),
// Text(
// "London, England",
// style: TextStyle(fontSize: 14,color: Colors.grey.withOpacity(0.8)),
// ),
// ],
// )
// ],
// ),
// ],
// ),
// SizedBox(
// height: 30,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// IconButton(
// icon: Icon(
// Icons.calendar_today_rounded,
// color: lightBlueColor,
// size: 25,
// ),
// onPressed: () {},
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Daily Practect",
// style: TextStyle(fontSize: 16),
// ),
// Text(
// "Sunday-Friday,",
// style: TextStyle(fontSize: 14,color: Colors.grey.withOpacity(0.8)),
// ),
// Text(
// "Open at 6:00 PM",
// style: TextStyle(fontSize: 14,color: Colors.grey.withOpacity(0.8)),
// ),
// ],
// )
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(
// height: 30,
// ),
// ],
// ),
// )


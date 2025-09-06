import 'package:emojis_demo/enter_detail_page.dart';
import 'package:emojis_demo/util/theme.dart';
import 'package:emojis_demo/widget_helper.dart';
import 'package:emojis_demo/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spinning_wheel/controller/spin_controller.dart';
import 'package:spinning_wheel/spinner_wheel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SpinnerController controller = SpinnerController();

  bool isMale =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomeBody(context),
    );
  }

  Widget _buildHomeBody(BuildContext context) {

    return SafeArea(
      minimum: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Counter at the top
            20.h,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "BMI",
                  textAlign: TextAlign.center,
                  style: TextStyles.robotoH1.copyWith(color: secondaryColor)
                ),
                8.w,
                Text(
                  "Calculator",
                  textAlign: TextAlign.center,
                  style: TextStyles.robotoH1.copyWith(color: primaryColor)
                ),
              ],
            ),
            16.h,
            Text("Please choose your gender", style: TextStyles.robotoTitle),
            16.h,
            _buildGender(primaryColor, "Male", "assets/ic_male.svg",primaryDark,isMale),
            16.h,
            _buildGender(secondaryColor, "Female", "assets/ic_female.svg",secondaryDark,!isMale),
            const Spacer(),
            SimpleButton(text: "Continue",backgroundColor: primaryColor,onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnterDetailPage(gender: isMale?"Male":"Female",)),
              );
            },),
            16.h
          ],
        ),
      ),
    );
  }

  Widget _buildGender(Color color, String text, String asset,Color textColor, bool isSelected) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          isMale=!isMale;
        });
      },
      child: Container(
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.withAlpha(50),
            border: isSelected ? Border.all(
              color: textColor, // Color of the border
              width: 2.0,         // Width of the border
              style: BorderStyle.solid, // Style of the border (e.g., solid, dashed)
            ):null
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(text, style: TextStyles.robotoTitle.copyWith(color: textColor)),
              SvgPicture.asset(asset,height: 120,width: 120,)
            ],
          )
      ),
    );
  }
}

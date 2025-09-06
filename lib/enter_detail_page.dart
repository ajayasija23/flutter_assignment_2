import 'package:emojis_demo/bmi_screen.dart';
import 'package:emojis_demo/util/theme.dart';
import 'package:emojis_demo/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';
import 'package:spinning_wheel/controller/spin_controller.dart';

class EnterDetailPage extends StatefulWidget {
  const EnterDetailPage({super.key, required this.gender});

  final String gender;

  @override
  State<EnterDetailPage> createState() => _EnterDetailPage(gender);
}

class _EnterDetailPage extends State<EnterDetailPage> {
  final SpinnerController controller = SpinnerController();
  int age = 20;
  int weight = 50;
  double height = 3.2;
  final String gender;

  _EnterDetailPage(this.gender);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildHomeBody(context));
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
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    "assets/ic_back.svg",
                    height: 24,
                    width: 24,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "BMI",
                      textAlign: TextAlign.center,
                      style: TextStyles.robotoH1.copyWith(
                        color: secondaryColor,
                      ),
                    ),
                    8.w,
                    Text(
                      "Calculator",
                      textAlign: TextAlign.center,
                      style: TextStyles.robotoH1.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            16.h,
            Text("Please Modify the values", style: TextStyles.robotoTitle),
            16.h,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildWeightOrAge(
                    secondaryColor,
                    "Weight (kg)",
                    weight.toString(),
                    secondaryDark,
                    onWeightUpdate,
                  ),
                ),
                16.w,
                Expanded(
                  child: _buildWeightOrAge(
                    secondaryColor,
                    "Age",
                    age.toString(),
                    secondaryDark,
                    onAgeUpdate,
                  ),
                ),
              ],
            ),
            16.h,
            _buildHeight(
              secondaryColor,
              "Height (cm)",
              height,
              secondaryDark,
              onHeightUpdate,
            ),
            const Spacer(),
            SimpleButton(
              text: "Continue",
              backgroundColor: primaryColor,
              onPressed: () {
                double bmi = calculateBMI();
                showDialog(
                  context: context,
                  builder: (context) => BmiResultScreen(
                    bmi: bmi,
                    weight: weight,
                    height: height,
                    age: age,
                    gender: gender,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
            16.h,
          ],
        ),
      ),
    );
  }

  double calculateBMI() {
    double heightM = (height * 30.48) / 100; // cm → m
    return weight / (heightM * heightM);
  }

  void onWeightUpdate(int value) {
    if (weight + value > 0) {
      setState(() {
        weight += value;
      });
    }
  }

  void onAgeUpdate(int value) {
    if (age + value > 0) {
      setState(() {
        age += value;
      });
    }
  }

  void onHeightUpdate(int value) {
    setState(() {
      height = roundTo2Decimals(value / 30.48);
    });
  }

  double roundTo2Decimals(double num) {
    return double.parse(num.toStringAsFixed(2));
  }

  Widget _buildWeightOrAge(
    Color color,
    String title,
    String value,
    Color textColor,
    void Function(int) onTap,
  ) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withAlpha(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.robotoBody.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
          Text(value, style: TextStyles.robotoH1.copyWith(color: textColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SvgPicture.asset("assets/ic_minus.svg"),
                onTap: () {
                  onTap(-1);
                },
              ),
              GestureDetector(
                child: SvgPicture.asset("assets/ic_plus.svg"),
                onTap: () {
                  onTap(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeight(
    Color color,
    String title,
    double value,
    Color textColor,
    void Function(int) onTap,
  ) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withAlpha(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyles.robotoBody.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyles.robotoH1.copyWith(color: textColor),
          ),
          SimpleRulerPicker(
            minValue: 80,
            maxValue: 250,
            onValueChanged: onTap,
            initialValue: (value * 30.48).toInt(),
          ),
        ],
      ),
    );
  }
}

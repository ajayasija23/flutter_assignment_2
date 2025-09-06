import 'package:emojis_demo/util/theme.dart';
import 'package:emojis_demo/widget_helper.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  BmiResultScreen({super.key, required this.gender, required this.weight, required this.height, required this.age, required this.bmi,required this.onPressed});
  final String gender;
  final int weight;
  final double height;
  final int age;
  final double bmi;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: lightPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Your BMI:",
                style: TextStyles.robotoBody,
              ),
              8.h,
              Text(
                bmi.toStringAsFixed(2),
                style: TextStyles.robotoH1.copyWith(color: primaryDark),
              ),
              6.h,
              const Divider(height: 20),
      
              // Weight / Height / Age / Gender
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InfoColumn(title: "Weight", value: "$weight kg"),
                  _InfoColumn(title: "Height", value: "$height ft"),
                  _InfoColumn(title: "Age", value: "$age"),
                  _InfoColumn(title: "Gender", value: gender),
                ],
              ),
              const SizedBox(height: 20),
              SimpleButton(text: "close",backgroundColor: primaryColor,onPressed: (){
                Navigator.of(context).pop();
                onPressed?.call();
              },),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;

  const _InfoColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.green, fontSize: 16)),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

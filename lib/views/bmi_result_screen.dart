import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    // this.bmiCalculator
  }) : super(key: key);
  final double bmi;
  // final BmiCalculator? bmiCalculator;
// BmiCalculator
//   String determineBmiCategory(double bmiValue) {
//     String category = "";
//     if (bmiValue < 16.0) {
//       category = underweightSevere;
//     } else if (bmiValue < 17.0) {
//       category = underweightModerate;
//     } else if (bmiValue < 18.5) {
//       category = underweightMild;
//     } else if (bmiValue < 25.0) {
//       category = normal;
//     } else if (bmiValue < 30.0) {
//       category = overweight;
//     } else if (bmiValue < 35.0) {
//       category = obeseI;
//     } else if (bmiValue < 40.0) {
//       category = obeseII;
//     } else if (bmiValue >= 40.0) {
//       category = obeseIII;
//     }
//     return category;
//   }

//   getMealRiskDescription(String categoryName) {
//     String desc = "";
//     switch (categoryName) {
//       case underweightSevere:
//       case underweightModerate:
//       case underweightMild:
//         desc = "Possible nutritional deficiency and osteoporosis";
//         break;
//       case normal:
//         desc = "Low risk (healthy rangel)";
//         break;
//       case overweight:
//         desc =
//             "Moderate risk of developing heart disease, high blood preassure, stroke, diabetes mellitus.";
//         break;
//       case obeseI:
//       case obeseII:
//       case obeseIII:
//         desc =
//             "High risk of developing heart disease, high blood preassure, stroke, diabetes mellitus, Metabolic Syndrome";
//         break;
//       default:
//     }
//     return desc;
//   }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory =
    bmiCalculator.determineBmiCategory();
    // final bmiDesc =
    bmiCalculator.getMealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Count Resault BMI",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Calculation Resault",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      //  (bmiCalculator.bmiCategory ==null) ? "";
                      bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: const Color(0xff517df6),
              child: const Center(
                child: Text(
                  "Recalculate",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

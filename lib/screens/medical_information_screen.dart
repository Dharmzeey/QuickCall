import 'package:flutter/material.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class MedicalInformation extends StatelessWidget {
  const MedicalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.spacing200,
              ),
              Text(
                "Medical Information",
                style: TextStyle(
                    fontSize: AppDimensions.font32, color: AppColors.mainColor),
              ),
              Container(
                height: AppDimensions.height100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/medical.png"),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              SizedBox(
                width: AppDimensions.width350,
                child: Text(
                  'Please, fill in your basic medical information. It helps during emergency situations',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: AppDimensions.font15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              Row(
                children: [
                  const Expanded(child: InfoTextInputWidget(label: "Age")),
                  SizedBox(
                    width: AppDimensions.spacing10,
                  ),
                  const Expanded(child: InfoTextInputWidget(label: "Gender"))
                ],
              ),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const InfoTextInputWidget(label: "Blood Group"),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const InfoTextInputWidget(label: "Genotype"),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const InfoTextInputWidget(label: "ALlergies"),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const InfoTextInputWidget(label: "Disease or Other conditions"),
              SizedBox(
                height: AppDimensions.spacing200,
              ),
              const ActionButton(text: "Skip", routeTo: AppRoutes.welcome),
              SizedBox(
                height: AppDimensions.spacing20,
              ),
              const ActionButton(text: "Continue", routeTo: AppRoutes.welcome),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quickcall/dummy_data/data.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';

class GeneralTips extends StatelessWidget {
  const GeneralTips({super.key});
  final List tips = EmergencyInformation.emergencyTips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.mainColor),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              child: const Text(
                'Cultivating habits that can prepare you for various unforeseen situations is very important. Here are few habits;',
                style: CustomTextStyles.primaryTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tips[index],
                      style: CustomTextStyles.primaryTextStyle
                          .copyWith(height: 1.7),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/smiley_widget.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int selectedIconIndex = -1;
  final bool isEnabled = true;
  final bool isProcessing = false;
  final List<dynamic> smileyIconsList = [
    [Icons.sentiment_very_satisfied, 'Great', Colors.green],
    [Icons.sentiment_satisfied, 'Good', Colors.yellow],
    [Icons.sentiment_neutral, 'Medium', Colors.orange],
    [Icons.sentiment_dissatisfied, 'Not Good', Colors.pink],
    [Icons.sentiment_very_dissatisfied, 'Very Bad', Colors.red],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.spacing100,
            ),
            Text(
              'FEEDBACK',
              style: CustomTextStyles.primaryTextStyle
                  .copyWith(fontSize: AppDimensions.font18),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            Container(
              height: AppDimensions.height200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/rating.png'),
                ),
              ),
            ),
            const Text(
              'How was the help received? ',
              style: CustomTextStyles.primaryTextStyle,
            ),
            SizedBox(
              height: AppDimensions.spacing50,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimensions.paddingMain),
              child: SizedBox(
                height: AppDimensions.height150,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: smileyIconsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIconIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(AppDimensions.paddingLittle),
                          child: SmileyWidget(
                            icon: smileyIconsList[index][0],
                            text: smileyIconsList[index][1],
                            iconColor: smileyIconsList[index][2],
                            size: selectedIconIndex == index
                                ? AppDimensions.font75
                                : AppDimensions.font50,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.spacing20,
            ),
            const Text(
              'Do you have a specific issue you would like to let us know about? ',
              style: CustomTextStyles.primaryTextStyle,
            ),
            SizedBox(
              height: AppDimensions.spacing10,
            ),
            Form(
              child: SizedBox(
                // height: AppDimensions.height300,
                width: AppDimensions.width350,
                child: TextFormField(
                  minLines: 6,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.mainColor,
                    // label: const Text('Tell us what you think'),
                    // labelStyle: TextStyle(
                    //     fontSize: AppDimensions.font20,
                    //     fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.spacing75,
            ),
            ActionButton(
              text: 'Submit',
              isEnabled: isEnabled,
              isProcessing: isProcessing,
              onPressedFunction: submitFeedBack,
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitFeedBack() async {}
}

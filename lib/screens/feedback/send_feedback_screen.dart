import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/feedback.dart';
import 'package:quickcall/controller/location_controller.dart';
import 'package:quickcall/routes/routes.dart';
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
  final LocationController locationController = Get.put(LocationController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _comment = TextEditingController();
  late String emergencyName;
  late String emergencyContact;

  int selectedIconIndex = -1;
  int rating = 0;
  final bool isEnabled = true;
  final bool isProcessing = false;
  final List<dynamic> smileyIconsList = [
    [Icons.sentiment_very_satisfied, 'Great', Colors.green, 5],
    [Icons.sentiment_satisfied, 'Good', Colors.yellow, 4],
    [Icons.sentiment_neutral, 'Medium', Colors.orange, 3],
    [Icons.sentiment_dissatisfied, 'Not Good', Colors.pink, 2],
    [Icons.sentiment_very_dissatisfied, 'Very Bad', Colors.red, 1],
  ];

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    emergencyName = arguments['emergencyName'];
    emergencyContact = arguments['emergencyContact'];
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: smileyIconsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIconIndex = index;
                          rating = smileyIconsList[index][3];
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
              key: _formKey,
              child: SizedBox(
                // height: AppDimensions.height300,
                width: AppDimensions.width350,
                child: TextFormField(
                  controller: _comment,
                  minLines: 6,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.mainColor,
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

  @override
  void dispose() {
    super.dispose();
    _comment.dispose();
  }

  Future<void> submitFeedBack() async {
    final location = locationController.localGovernment.value;
    final response = await FeedBackApi().sendFeedback(
        location, _comment.text, emergencyName, emergencyContact, rating);
    if (response) {
      Get.offAndToNamed(AppRoutes.welcome);
    }
  }
}

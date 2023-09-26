import 'package:flutter/material.dart';
import 'package:quickcall/api/feedback.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';

class FetchFeedBacks extends StatelessWidget {
  const FetchFeedBacks({super.key});

  Future<List<dynamic>> awaitFeedback() async {
    final feedbacks = await FeedBackApi().fetchFeedbacks();
    final listFeedbacks = List<dynamic>.from(feedbacks);
    return listFeedbacks;
  }

  static const List ratings = [
    "None",
    "Very bad",
    "Bad",
    "Medium",
    "Good",
    "Great"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        title: Text(
          'Your Feedbacks',
          style: TextStyle(
              color: AppColors.mainColor, fontSize: AppDimensions.font26),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMain),
        child: FutureBuilder(
          future: awaitFeedback(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              final error = snapshot.error.toString();
              if (error.contains('SocketException')) {
                return Text(
                  'No internet Connection',
                  style: CustomTextStyles.primaryTextStyle,
                );
              } else {
                return Text(
                  'An Error Occured',
                  style: CustomTextStyles.primaryTextStyle,
                );
              }
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'You do not have any feedback',
                  style: CustomTextStyles.primaryTextStyle,
                ),
              );
            } else {
              final feedbacks = snapshot.data;
              return Column(
                children: [
                  Container(
                    height: AppDimensions.height200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/feedback.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: feedbacks!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(AppDimensions.paddingSmall),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${feedbacks[index].createdAt}'.split(" ")[0],
                                style: CustomTextStyles.primaryTextStyle,
                              ),
                              Container(
                                width: AppDimensions.screenWidth / 1.2,
                                padding:
                                    EdgeInsets.all(AppDimensions.paddingLittle),
                                margin: EdgeInsets.all(AppDimensions.spacing10),
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withOpacity(0.15000000596046448),
                                  border: Border.all(
                                    width: 1.0,
                                    color: AppColors.mainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.spacing10),
                                ),
                                height: AppDimensions.height200,
                                child: SingleChildScrollView(
                                  child: Text(
                                    '${feedbacks[index].comment}',
                                    style: CustomTextStyles.primaryTextStyle,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Emergency Type: ${feedbacks[index].emergencyType}',
                                    style: CustomTextStyles.primaryTextStyle,
                                  ),
                                  Text(
                                    'Rating: ${ratings[feedbacks[index].rating]}',
                                    style: CustomTextStyles.primaryTextStyle,
                                  ),
                                ],
                              )
                            ],

                            // Text(
                            //   'Emergency Contact: ${feedbacks[index].emergencyContact}',
                            //   style: TextStyle(
                            //     fontSize: AppDimensions.font18,
                            //   ),
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        title: const Text(
          'Your Feedbacks',
          style: TextStyle(color: AppColors.mainColor),
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
              return Text(
                'Error: ${snapshot.error}',
                style: CustomTextStyles.primaryTextStyle,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'You do not have any feedback',
                  style: CustomTextStyles.primaryTextStyle,
                ),
              );
            } else {
              final feedbacks = snapshot.data;
              return ListView.builder(
                itemCount: feedbacks!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(
                        AppDimensions.paddingSmall,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${feedbacks[index].createdAt}',
                            style: TextStyle(
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                          Text(
                            'Rating: ${feedbacks[index].rating}',
                            style: TextStyle(
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                          Text(
                            'Emergency Type: ${feedbacks[index].emergencyType}',
                            style: TextStyle(
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                          Text(
                            'Emergency Contact: ${feedbacks[index].emergencyContact}',
                            style: TextStyle(
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                          Text(
                            'Comment: ${feedbacks[index].comment}',
                            style: TextStyle(
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

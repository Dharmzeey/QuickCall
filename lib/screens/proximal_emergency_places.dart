import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/utils/launchers.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';

class ProximalEmergencyPlaces extends StatelessWidget {
  const ProximalEmergencyPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    final String title = arguments['title'];
    final nearestHelp = List<dynamic>.from(arguments['nearestHelp']);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.mainColor),
        backgroundColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingMain),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: nearestHelp.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        EdgeInsets.symmetric(vertical: AppDimensions.spacing10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nearestHelp[index][0],
                          style: TextStyle(fontSize: AppDimensions.font15),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                double lat =
                                    double.parse(nearestHelp[index][1]);
                                double lng =
                                    double.parse(nearestHelp[index][2]);

                                await openGoogleMaps(lat, lng);
                              },
                              icon: const Icon(Icons.call_split_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                openPhoneDialer(nearestHelp[index][3]);
                              },
                              icon: const Icon(Icons.wifi_calling_3_sharp),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.spacing20),
              child: const Text(
                'This reponse is generated based on your current location ',
                style: CustomTextStyles.primaryTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

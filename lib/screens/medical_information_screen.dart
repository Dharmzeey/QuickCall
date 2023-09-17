import 'package:flutter/material.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class MedicalInformation extends StatefulWidget {
  const MedicalInformation({super.key});

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  final _formkey = GlobalKey<FormState>();
  late final TextEditingController _bloodGroup;
  late final TextEditingController _genotype;
  late final TextEditingController _allergies;
  late final TextEditingController _otherConditions;
  bool _isEnabled = false;

  @override
  void initState() {
    _bloodGroup = TextEditingController();
    _genotype = TextEditingController();
    _allergies = TextEditingController();
    _otherConditions = TextEditingController();

    _bloodGroup.addListener(() {
      checkFieldValue();
    });
    _genotype.addListener(() {
      checkFieldValue();
    });
    super.initState();
  }

  void checkFieldValue() {
    if (_bloodGroup.text.isNotEmpty && _genotype.text.isNotEmpty) {
      setState(() {
        _isEnabled = true;
      });
    } else {
      setState(() {
        _isEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMain),
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimensions.spacing200,
                  ),
                  Text(
                    "Medical Information",
                    style: TextStyle(
                        fontSize: AppDimensions.font32,
                        color: AppColors.mainColor),
                  ),
                  Container(
                    height: AppDimensions.height200,
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
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Blood Group",
                    inputController: _bloodGroup,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Genotype",
                    inputController: _genotype,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Allergies",
                    inputController: _allergies,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Disease or Other conditions",
                    inputController: _otherConditions,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing200,
                  ),
                  // const ActionButton(
                  //   text: "Skip",
                  //   routeTo: AppRoutes.welcome,
                  //   isEnabled: true,
                  //   isProcessing: false,
                  // ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  ActionButton(
                    text: "Continue",
                    routeTo: AppRoutes.welcome,
                    isEnabled: _isEnabled,
                    isProcessing: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloodGroup.dispose();
    _genotype.dispose();
    _allergies.dispose();
    _otherConditions.dispose();
    super.dispose();
  }
}

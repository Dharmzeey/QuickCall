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
  late final TextEditingController _age;
  late final TextEditingController _gender;
  late final TextEditingController _bloodGroup;
  late final TextEditingController _genotype;
  late final TextEditingController _allergies;
  late final TextEditingController _otherConditions;
  bool isEnabled = false;

  void checkFieldValue(
      String age, String gender, String bloodGroup, String genotype) {
    if (age.length > 1 &&
        gender.length > 3 &&
        bloodGroup.isNotEmpty &&
        genotype.isNotEmpty) {
      setState(() {
        isEnabled = true;
      });
    } else {
      setState(() {
        isEnabled = false;
      });
    }
  }

  @override
  void initState() {
    _age = TextEditingController();
    _gender = TextEditingController();
    _bloodGroup = TextEditingController();
    _genotype = TextEditingController();
    _allergies = TextEditingController();
    _otherConditions = TextEditingController();

    _age.addListener(() {
      checkFieldValue(
          _age.text, _gender.text, _bloodGroup.text, _genotype.text);
    });
    _gender.addListener(() {
      checkFieldValue(
          _age.text, _gender.text, _bloodGroup.text, _genotype.text);
    });
    _bloodGroup.addListener(() {
      checkFieldValue(
          _age.text, _gender.text, _bloodGroup.text, _genotype.text);
    });
    _genotype.addListener(() {
      checkFieldValue(
          _age.text, _gender.text, _bloodGroup.text, _genotype.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _age.dispose();
    _gender.dispose();
    _bloodGroup.dispose();
    _genotype.dispose();
    _allergies.dispose();
    _otherConditions.dispose();
    super.dispose();
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
                      Expanded(
                          child: InfoTextInputWidget(
                        label: "Age",
                        inputController: _age,
                      )),
                      SizedBox(
                        width: AppDimensions.spacing10,
                      ),
                      Expanded(
                          child: InfoTextInputWidget(
                        label: "Gender",
                        inputController: _gender,
                      ))
                    ],
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
                  const ActionButton(
                    text: "Skip",
                    routeTo: AppRoutes.welcome,
                    isEnabled: true,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  ActionButton(
                    text: "Continue",
                    routeTo: AppRoutes.welcome,
                    isEnabled: isEnabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

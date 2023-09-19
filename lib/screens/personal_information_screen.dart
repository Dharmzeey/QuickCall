import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/information.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _phoneNumber;
  late final TextEditingController _age;
  late final TextEditingController _emergencyContact;
  late final TextEditingController _emergencyContactrelationship;
  late final TextEditingController _emergencyContactphoneNumber;
  bool isEnabled = false;
  bool isProcessing = false;
  String? _selectedGender;
  bool isGenderSelected = false;
  final List<String> _genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _phoneNumber = TextEditingController();
    _age = TextEditingController();
    _emergencyContact = TextEditingController();
    _emergencyContactrelationship = TextEditingController();
    _emergencyContactphoneNumber = TextEditingController();

    _firstName.addListener(() {
      _checkFieldValue();
    });
    _lastName.addListener(() {
      _checkFieldValue();
    });
    _email.addListener(() {
      _checkFieldValue();
    });
    _phoneNumber.addListener(() {
      _checkFieldValue();
    });
    _age.addListener(() {
      _checkFieldValue();
    });
  }

  void _checkFieldValue() {
    if (_firstName.text.length > 2 &&
        _lastName.text.length > 2 &&
        _email.text.length > 12 &&
        _phoneNumber.text.length > 10 &&
        _age.text.length > 1 &&
        isGenderSelected) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMain),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimensions.spacing150,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: AppDimensions.font32,
                        color: AppColors.mainColor),
                  ),
                  SizedBox(
                    height: AppDimensions.spacing100,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InfoTextInputWidget(
                        inputController: _firstName,
                        label: "First Name",
                      )),
                      SizedBox(
                        width: AppDimensions.spacing10,
                      ),
                      Expanded(
                          child: InfoTextInputWidget(
                        inputController: _lastName,
                        label: "Surname",
                      ))
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  InfoTextInputWidget(label: "Email", inputController: _email),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  InfoTextInputWidget(
                      label: "Phone Number", inputController: _phoneNumber),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InfoTextInputWidget(
                          inputController: _age,
                          label: "Age",
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.spacing10,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                              isGenderSelected = true;
                            });
                          },
                          items: _genders.map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                                style: CustomTextStyles.primaryTextStyle,
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.mainColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text(
                              'Gender',
                              style: CustomTextStyles.primaryTextStyle,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.mainColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          dropdownColor: AppColors.bgColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  InfoTextInputWidget(
                      label: "Emergency Contact Name",
                      inputController: _emergencyContact),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  InfoTextInputWidget(
                      label: "Relationship with the person above",
                      inputController: _emergencyContactrelationship),
                  SizedBox(
                    height: AppDimensions.spacing30,
                  ),
                  InfoTextInputWidget(
                      label: "Phone Number of Emergency Contact",
                      inputController: _emergencyContactphoneNumber),
                  SizedBox(
                    height: AppDimensions.spacing200,
                  ),
                  ActionButton(
                    text: "Continue",
                    isEnabled: isEnabled,
                    isProcessing: false,
                    onPressedFunction: createBasicInfo,
                  )
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
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    _age.dispose();

    _emergencyContact.dispose();
    _emergencyContactrelationship.dispose();
    _emergencyContactphoneNumber.dispose();
    super.dispose();
  }

  Future<void> createBasicInfo() async {
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
    final bool createInfoResponse = await UserInfo().submitPersonalInfo(
        _firstName,
        _lastName,
        _email,
        _phoneNumber,
        _selectedGender!,
        _age,
        _emergencyContact,
        _emergencyContactrelationship,
        _emergencyContactphoneNumber);
    if (createInfoResponse) {
      Get.offAndToNamed(AppRoutes.medicalInformation);
    } else {}
    setState(() {
      isProcessing = false;
      isEnabled = true;
    });
  }
}

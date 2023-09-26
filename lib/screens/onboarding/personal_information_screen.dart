import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/information.dart';
import 'package:quickcall/models/user_model.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/utils/styles.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key, this.initialData});
  final User? initialData;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _emergencyContact = TextEditingController();
  final TextEditingController _emergencyContactrelationship =
      TextEditingController();
  final TextEditingController _emergencyContactphoneNumber =
      TextEditingController();
  bool isEnabled = false;
  bool isProcessing = false;
  String? _selectedGender;
  bool isGenderSelected = false;
  final List<String> _genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _firstName.text = widget.initialData!.firstName;
      _lastName.text = widget.initialData!.lastName;
      _email.text = widget.initialData!.email;
      _phoneNumber.text = widget.initialData!.phoneNo1;
      _age.text = widget.initialData!.age;
      _selectedGender = widget.initialData!.gender;
      _emergencyContact.text = widget.initialData?.nameOfEmerContact ?? '';
      _emergencyContactrelationship.text =
          widget.initialData?.relationship ?? '';
      _emergencyContactphoneNumber.text =
          widget.initialData?.emergencyPhoneNo ?? '';
      isGenderSelected = true;
      isEnabled = true;
    }
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
        isGenderSelected == true) {
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
      appBar: AppBar(
        automaticallyImplyLeading: widget.initialData != null ? true : false,
        backgroundColor: AppColors.bgColor,
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
          size: AppDimensions.font32,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMain),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: AppDimensions.font32,
                        color: AppColors.mainColor),
                  ),
                  SizedBox(
                    height: AppDimensions.spacing75,
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
                        label: "Last Name",
                      ))
                    ],
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(label: "Email", inputController: _email),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                      label: "Phone Number", inputController: _phoneNumber),
                  SizedBox(
                    height: AppDimensions.spacing20,
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
                            _checkFieldValue();
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
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.paddingSmall,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.mainColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text(
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
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                      label: "Emergency Contact Name",
                      inputController: _emergencyContact),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                      label: "Relationship with the person above",
                      inputController: _emergencyContactrelationship),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                      label: "Phone Number of Emergency Contact",
                      inputController: _emergencyContactphoneNumber),
                  SizedBox(
                    height: AppDimensions.spacing150,
                  ),
                  ActionButton(
                    text: widget.initialData != null ? "Submit" : "Continue",
                    isEnabled: isEnabled,
                    isProcessing: isProcessing,
                    onPressedFunction: submitBasicInfo,
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

  Future<void> submitBasicInfo() async {
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
    final bool submitInfoResponse = await UserInfo().submitPersonalInfo(
      _firstName,
      _lastName,
      _email,
      _phoneNumber,
      _selectedGender!,
      _age,
      _emergencyContact,
      _emergencyContactrelationship,
      _emergencyContactphoneNumber,
      widget.initialData != null ? true : false,
    );
    if (widget.initialData == null && submitInfoResponse) {
      Get.offAndToNamed(AppRoutes.medicalInformation);
    } else {
      Get.toNamed(AppRoutes.welcome);
    }
    setState(() {
      isProcessing = false;
      isEnabled = true;
    });
  }
}

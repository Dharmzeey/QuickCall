import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcall/api/information.dart';
import 'package:quickcall/models/user_model.dart';
import 'package:quickcall/routes/routes.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';
import 'package:quickcall/widgets/button_widgets.dart';
import 'package:quickcall/widgets/text_input_widget.dart';

class MedicalInformation extends StatefulWidget {
  const MedicalInformation({super.key, this.initialData});
  final MedicalInformaton? initialData;

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _bloodGroup = TextEditingController();
  final TextEditingController _genotype = TextEditingController();
  final TextEditingController _allergies = TextEditingController();
  final TextEditingController _otherConditions = TextEditingController();
  final TextEditingController _familyDoctorContact = TextEditingController();
  bool isEnabled = false;
  bool isProcessing = false;

  @override
  void initState() {
    if (widget.initialData != null) {
      _bloodGroup.text = widget.initialData!.bloodType;
      _genotype.text = widget.initialData!.genotype;
      _allergies.text = widget.initialData?.allergies?.join(",") ?? '';
      _otherConditions.text = widget.initialData?.chronicConditions?.join(",") ?? '';
      _familyDoctorContact.text = widget.initialData?.famDocContact ?? '';
      isEnabled = true;
    }

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
              key: _formkey,
              child: Column(
                children: [
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
                    isReadOnly:
                        widget.initialData?.bloodType != null ? false : true,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Genotype",
                    inputController: _genotype,
                    isReadOnly:
                        widget.initialData?.genotype != null ? false : true,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Allergies. Use ',' to seperate allergies",
                    inputController: _allergies,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Disease or Other conditions. Use ',' to seperate",
                    inputController: _otherConditions,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing20,
                  ),
                  InfoTextInputWidget(
                    label: "Family Doctor Contact",
                    inputController: _familyDoctorContact,
                  ),
                  SizedBox(
                    height: AppDimensions.spacing150,
                  ),
                  ActionButton(
                    text: widget.initialData != null ? "Submit" : "Continue",
                    isEnabled: isEnabled,
                    isProcessing: false,
                    onPressedFunction: createMedicalInfo,
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
    _familyDoctorContact.dispose();
    super.dispose();
  }

  Future<void> createMedicalInfo() async {
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
    final bool submitInfoResponse = await UserInfo().submitMedicalInfo(
      _bloodGroup,
      _genotype,
      _allergies,
      _otherConditions,
      _familyDoctorContact,
      widget.initialData != null ? true : false,
    );
    if (submitInfoResponse) {
      Get.offAndToNamed(AppRoutes.welcome);
    } else {}
    setState(() {
      isProcessing = true;
      isEnabled = false;
    });
  }
}

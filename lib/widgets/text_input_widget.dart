import 'package:flutter/material.dart';
import 'package:quickcall/utils/colors.dart';
import 'package:quickcall/utils/dimension.dart';

class InfoTextInputWidget extends StatelessWidget {
  const InfoTextInputWidget({
    super.key,
    required this.label,
    required this.inputController,
    this.isReadOnly,
  });
  final String label;
  final TextEditingController inputController;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.mainColor),
      controller: inputController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainColor, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall),
        label: Text(label),
        labelStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: AppDimensions.font20,
            fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({
    super.key,
    required this.label,
    required this.inputController,
    this.isReadOnly,
  });
  final String label;
  final TextEditingController inputController;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.mainColor),
      controller: inputController,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainColor, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall),
        label: Text(label),
        labelStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: AppDimensions.font20,
            fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(),
        suffixIcon: GestureDetector()
      ),
    );
  }
}




// class InfoTextInputWidget extends StatelessWidget {
//   const InfoTextInputWidget({super.key, required this.label});
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide:
//                 const BorderSide(color: AppColors.mainColor, width: 1.0),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           label: Text(label),
//           labelStyle: TextStyle(
//               color: AppColors.mainColor,
//               fontSize: AppDimensions.font20,
//               fontWeight: FontWeight.w400),
//           border: const OutlineInputBorder()),
//     );
//   }
// }

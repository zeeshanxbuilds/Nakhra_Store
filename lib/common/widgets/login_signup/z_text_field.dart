import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/sizes.dart';

class ZTextFormField extends StatelessWidget {
  const ZTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
        const SizedBox(height: ZSizes.xs),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,

          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: ZColors.grey10,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ZColors.borderDark),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}

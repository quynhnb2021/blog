import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/text_styles.dart';

class InputText extends StatefulWidget {
  final String label;
  final bool? colorError;
  final bool? isMultiLine;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autofocus;
  final Function(String)? onChanged;
  const InputText(
      {Key? key,
      required this.label,
      this.colorError,
      this.isMultiLine,
      this.controller,
      this.obscureText,
      this.autofocus,
      this.onChanged})
      : super(key: key);

  @override
  InputTextState createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
      //   child: Text(
      //     widget.label,
      //     textAlign: TextAlign.center,
      //     style: TextStyles.regularText12.w600
      //         .setColor(Colors.white)
      //         .copyWith(letterSpacing: 0.1),
      //   ),
      // ),
      AnimatedContainer(
          padding: const EdgeInsets.all(24),
          duration: const Duration(milliseconds: 200),
          // decoration: focusNode.hasFocus
          //     ? BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: [
          //             BoxShadow(
          //                 blurRadius: 0,
          //                 spreadRadius: 3,
          //                 color: widget.colorError == true
          //                     ? AppColors.colorRed100BGFaded
          //                     : AppColors.textGrayLeftColor.withAlpha(50))
          //           ])
          //     : null,
          child: SizedBox(
            height: 100,
            child: Form(
              key: _formKey,
              child: CupertinoTextField(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  obscureText: widget.obscureText ?? false,
                  controller: widget.controller,
                  focusNode: focusNode,
                  maxLines: 10000,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  autofocus: widget.autofocus ?? false,
                  onChanged: widget.onChanged,
                  cursorColor: Colors.grey,
                  placeholder: widget.label,
                  placeholderStyle: TextStyles.regularText14.w400
                      .setColor(AppColors.contenNeutral700Color),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(
                      width: 1,
                      color: AppColors.borderColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  style: TextStyles.regularText16
                      .setColor(AppColors.contentLightModeColor)),
            ),
          ))
    ]);
  }
}

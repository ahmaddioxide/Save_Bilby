

import 'package:flutter/material.dart';
import 'package:save_the_bilby_fund/constants/sizes.dart';

import '../../constants/text_strings.dart';

class Input_Field extends StatelessWidget {
  final String LabelText;
  final String HintText;
  final IconData PrefixIcon;
  final IconData? SuffixIcon;
  bool? isIcon;

  Input_Field({Key? key, required this.LabelText, required this.HintText, required this.PrefixIcon,  this.isIcon=false, this.SuffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: isIcon==false? TextFormField(decoration: InputDecoration(
        prefixIcon: Icon(PrefixIcon),
        labelText: LabelText,
        hintText: HintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),): TextFormField(decoration: InputDecoration(
          prefixIcon: Icon(PrefixIcon),
          labelText: LabelText,
          hintText: HintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: IconButton(
            onPressed: null,
            icon: Icon(SuffixIcon),
          ),
        ),)
    );
  }
}

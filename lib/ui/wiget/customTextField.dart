import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.isChatText = false,
    this.isSearch = false,
    this.focusNode,
    this.onTap,
    this.textEditingController,
  });

  final String? hintText;
  final bool isChatText;
  final bool isSearch;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;

  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon:
              isSearch
                  ? (Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                    decoration: BoxDecoration(
                      color: grey.withAlpha(110),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ))
                  : isChatText
                  ? InkWell(onTap: onTap, child: Icon(Icons.send))
                  : null,
          filled: true,
          fillColor: grey.withAlpha(50),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

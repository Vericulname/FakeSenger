import 'package:chat_app_fr_this_time/ui/wiget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomChatBar extends StatelessWidget {
  const BottomChatBar({super.key, this.controller, this.onTap, this.onChanged});

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
      child: Row(
        children: [
          InkWell(child: CircleAvatar(child: Icon(Icons.send))),
          10.horizontalSpace,
          Expanded(
            child: CustomTextField(
              onChanged: (p0) {},
              hintText: "Nhắn tin",
              isChatText: true,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

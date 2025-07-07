import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/core/model/message_model.dart';
import 'package:chat_app_fr_this_time/ui/wiget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
          Expanded(
            child: CustomTextField(
              textEditingController: controller,
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

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isCurrentUser = true,
    required this.message,
  });

  final bool isCurrentUser;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius:
              isCurrentUser
                  ? BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  )
                  : BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
          color: isCurrentUser ? grey : Colors.black,
        ),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              message.message!,
              style: body.copyWith(color: isCurrentUser ? null : white),
            ),
            5.verticalSpace,
            Text(
              DateFormat("HH:mm").format(message.timestamp!),
              style: small.copyWith(
                fontSize: 15,
                color: isCurrentUser ? null : white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

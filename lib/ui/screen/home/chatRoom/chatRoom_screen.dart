import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatRoom/chat_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 1.sw * 0.05,
              vertical: 10.h,
            ),
            child: Column(
              children: [
                15.verticalSpace,
                _headerBuilder(context),
                15.verticalSpace,
                // Expanded(
                //   child: ListView.separated(
                //     separatorBuilder: (context, index) => 10.verticalSpace,
                //     itemCount: 10,
                //     itemBuilder: (context, index) {},
                //   ),
                // ),
                BottomChatBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _headerBuilder(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: grey.withOpacity(0),
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        10.horizontalSpace,
        const Text("user name", style: h),
        const Spacer(),
        Container(child: Icon(Icons.more_vert_outlined)),
      ],
    );
  }
}

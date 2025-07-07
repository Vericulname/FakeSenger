import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/chat_service.dart';
import 'package:chat_app_fr_this_time/extensions/snackBar_extension.dart';
import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatRoom/chatRoom_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatRoom/chat_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatelessWidget {
  const ChatroomScreen({super.key, required this.receiver});

  final UserModel receiver;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create:
          (context) => ChatroomViewmodel(ChatService(), currentUser!, receiver),
      child: Consumer<ChatroomViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.sw * 0.05,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        15.verticalSpace,
                        _headerBuilder(context),
                        15.verticalSpace,
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(0),
                            separatorBuilder:
                                (context, index) => 10.verticalSpace,
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              final message = model.messages[index];
                              return ChatBubble(
                                isCurrentUser:
                                    message.senderId == currentUser!.uid,
                                message: message,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomChatBar(
                  controller: model.controller,
                  onTap: () async {
                    try {
                      await model.saveMessage();
                    } catch (e) {
                      context.showSnackBar(e.toString());
                    }
                  },
                ),
              ],
            ),
          );
        },
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
        Text(receiver.username!, style: h),
        const Spacer(),
        Container(child: Icon(Icons.more_vert_outlined)),
      ],
    );
  }
}

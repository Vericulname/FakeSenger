import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/database_service.dart';
import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatList/chatList_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/wiget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatlistScreen extends StatelessWidget {
  const ChatlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;

    return ChangeNotifierProvider(
      create: (context) => ChatlistViewmodel(DatabaseService(), currentUser!),
      child: Consumer<ChatlistViewmodel>(
        builder: (context, model, _) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 1.sw * 0.06,
              vertical: 10.h,
            ),
            child: Column(
              children: [
                20.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("chat", style: h),
                ),
                20.verticalSpace,
                CustomTextField(
                  hintText: "tìm kiếm",
                  isSearch: true,
                  onChanged: model.searchUser,
                ),
                20.verticalSpace,
                Expanded(
                  child:
                      model.filterusers.isEmpty
                          ? const Expanded(
                            child: Center(child: Text("Trống trơn :(")),
                          )
                          : ListView.separated(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 0,
                            ),
                            separatorBuilder:
                                (context, index) => 10.verticalSpace,
                            itemCount: model.filterusers.length,
                            itemBuilder: (context, index) {
                              final user = model.filterusers[index];
                              return ChatListTile(
                                user: user,
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      chatRoom,
                                      arguments: user,
                                    ),
                                currentUserUid: currentUser!.uid,
                              );
                            },
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.user,
    this.onTap,
    this.currentUserUid,
  });

  final UserModel user;
  final String? currentUserUid;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isCorrectChatRoom =
        user.lastMessage?["chatRoomId"] == null
            ? false
            : user.lastMessage!["chatRoomId"].toString().contains(
              currentUserUid!,
            );

    return Material(
      child: ListTile(
        onTap: onTap,
        tileColor: grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05),
        leading: CircleAvatar(child: Text(user.username![0])),
        title: Text(user.username!),
        //danh sach user van chua lastMessage nen no van se hien du nguoi dung hien tai la ng dung moi
        subtitle: Text(
          !isCorrectChatRoom
              ? ""
              : user.lastMessage == null
              ? ""
              : user.lastMessage!["content"],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              user.lastMessage?["timestamp"] != null
                  ? ""
                  : !isCorrectChatRoom
                  ? ""
                  : DateFormat(
                    "HH:mm",
                  ).format(DateTime(user.lastMessage!["timestamp"])),
              style: small.copyWith(color: grey, fontSize: 15),
            ),
            5.verticalSpace,
            user.unreadMessageCount == 0
                ? SizedBox(height: 15)
                : !isCorrectChatRoom
                ? SizedBox(height: 15)
                : CircleAvatar(
                  radius: 10.r,
                  backgroundColor: black,
                  child: Text(
                    user.unreadMessageCount.toString(),
                    style: TextStyle(color: white),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

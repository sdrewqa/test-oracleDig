import 'package:app/features/chat(just_view)/ui(view)/widgets/chats_message_widget.dart';
import 'package:flutter/material.dart';

class ChatViewWidget extends StatelessWidget {
  final String name;
  final Image? avatar;
  final List? messages;
  ChatViewWidget({super.key, required this.name, this.avatar, this.messages});

  /// 0 - me 1 partner
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          name,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Text'),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(
            height: 0.5,
            color: Color.fromRGBO(0, 0, 0, 0.30),
          ),
        ),
      ),
      body: messages!.isNotEmpty
          ? Container(
              padding: EdgeInsets.only(top: 32, left: 16, right: 16),
              child: ListView.builder(
                itemCount: messages!.length,
                itemBuilder: (context, index) {
                  final message = messages![index];
                  return ChatsMessageWidget(
                    message: message.text,
                    isMe: message.isMe,
                  );
                },
              ),
            )
          : Text('Zero Messages'),
    );
  }
}

import 'package:app/features/chat(just_view)/ui(view)/widgets/chats_chat_view_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatsListViewWidget extends StatelessWidget {
  ChatsListViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: SizedBox(
            height: 99.5,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          margin: const EdgeInsets.only(top: 16.5, bottom: 19),
                          child: CircleAvatar(
                            child: _chats[index].avatar != null
                                ? CachedNetworkImage(imageUrl: 'URL')
                                : const Icon(Icons.person, size: 35),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 18,
                              margin: const EdgeInsets.only(top: 16),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                _chats[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 36,
                              margin: const EdgeInsets.only(bottom: 23),
                              width: MediaQuery.of(context).size.width - 112,
                              child: Text(
                                maxLines: 2,
                                _chats[index].lastMessage,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: 13),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 0.5,
                  color: Color.fromRGBO(0, 0, 0, 0.30),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatViewWidget(
                        name: _chats[index].name,
                        messages: _chats[index].chat,
                      )),
            );
          },
        );
      },
    );
  }
}

class UserInChats {
  // Чаты что показаны в Chats скрин
  final String lastMessage;
  final String name;
  final Image? avatar;
  final List? chat;
  UserInChats(
      {required this.lastMessage,
      required this.name,
      required this.avatar,
      required this.chat});
}

class Message {
  // модель сообщения в чате
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

// Данные
final List<UserInChats> _chats = [
  UserInChats(
      lastMessage: 'Thank you! That was very helpful!',
      name: 'James',
      avatar: null,
      chat: [
        Message(
            text:
                "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
            isMe: false),
        Message(
            text:
                "A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.",
            isMe: true),
        Message(text: "Thank you! That was very helpful!", isMe: false)
      ]),
  UserInChats(
      lastMessage: 'I know... I’m trying to get the funds.',
      name: 'Will Kenny',
      avatar: null,
      chat: [
        Message(
            text:
                "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
            isMe: false),
      ]),
  UserInChats(
      lastMessage:
          'I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm...',
      name: 'Beth Willians',
      avatar: null,
      chat: [
        Message(
            text:
                "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
            isMe: false),
        Message(
            text:
                "A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.",
            isMe: true),
        Message(text: "Thank you! That was very helpful!", isMe: false),
        Message(
            text:
                "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
            isMe: false),
        Message(
            text:
                "A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.",
            isMe: true),
        Message(text: "Thank you! That was very helpful!", isMe: false)
      ]),
  UserInChats(
      lastMessage:
          'Wanted to ask if you’re available available available available available available availableavailable available for a portrait shoot next week.',
      name: 'Rev Shawn',
      avatar: null,
      chat: [
        Message(
            text:
                "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
            isMe: false),
        Message(text: "Thank you! That was very helpful!", isMe: false)
      ]),
];

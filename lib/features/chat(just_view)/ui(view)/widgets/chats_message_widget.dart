import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatsMessageWidget extends StatelessWidget {
  final Image? avatarUrl;
  final bool isMe;
  final String message;
  const ChatsMessageWidget(
      {super.key, this.avatarUrl, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !isMe ? buildAvatar(context, isMe) : const SizedBox(),
            Flexible(
              child: Container(
                constraints: const BoxConstraints(minHeight: 50),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.03),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topLeft: Radius.circular(!isMe ? 0 : 6),
                        topRight: Radius.circular(isMe ? 0 : 6))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 13),
                  ),
                ),
              ),
            ),
            isMe ? buildAvatar(context, isMe) : const SizedBox(),
          ],
        ));
  }

  Widget buildAvatar(BuildContext context, bool isMe) {
    return Row(
      children: [
        SizedBox(
          width: isMe ? 16 : 0,
        ),
        Container(
          height: 28,
          margin: const EdgeInsets.only(top: 2),
          width: 28,
          child: CircleAvatar(
            child: avatarUrl != null
                ? CachedNetworkImage(imageUrl: 'URL')
                : const Icon(Icons.person, size: 18),
          ),
        ),
        SizedBox(
          width: !isMe ? 16 : 0,
        ),
      ],
    );
  }
}

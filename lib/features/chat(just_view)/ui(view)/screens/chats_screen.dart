import 'package:flutter/material.dart';

import '../widgets/chats_listview_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chats',
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
      body: ChatsListViewWidget(),
    );
  }
}

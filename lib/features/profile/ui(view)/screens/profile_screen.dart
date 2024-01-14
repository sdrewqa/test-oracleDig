import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers(view-model)/profile_provider.dart';
import '../widgets/profile_user_album_widget.dart';
import '../widgets/profile_user_info_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).getProfile();
      Provider.of<ProfileProvider>(context, listen: false)
          .fetchPhotos(2, 6, 0, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(
            children: [ProfielUserInfoWidget(), const ProfileUserAlbumWidget()],
          )),
        ),
      ),
    );
  }
}

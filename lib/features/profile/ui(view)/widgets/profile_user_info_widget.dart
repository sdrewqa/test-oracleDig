import 'package:app/core/common/widgets/custom_button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers(view-model)/profile_provider.dart';

class ProfielUserInfoWidget extends StatelessWidget {
  ProfielUserInfoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          width: 128,
          height: 128,
          child: CircleAvatar(
            child: provider.currentUser?.photoURL != null
                ? CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: provider.currentUser!.photoURL.toString(),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      child: const CircularProgressIndicator(),
                    ),
                    // errorWidget: (context, url, error) => const Icon(
                    //   Icons.person,
                    //   size: 80,
                    // ),
                  )
                : Icon(
                    Icons.person,
                    size: 80,
                  ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Jane',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'San francisco, ca',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        CustomButtonWidget(
            buttonText: 'follow jane'.toUpperCase(),
            buttonThemeIsDark: true,
            buttonOnPressed: () {}),
        const SizedBox(
          height: 16,
        ),
        CustomButtonWidget(
            buttonText: 'message'.toUpperCase(),
            buttonThemeIsDark: false,
            buttonOnPressed: () {}),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';

class RowUserInfoWidget extends StatelessWidget {
  const RowUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.images.avatarAuth.image(width: 28, height: 28),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pawel Czerwinski',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '@pawel_czerwinski',
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        )
      ],
    );
  }
}

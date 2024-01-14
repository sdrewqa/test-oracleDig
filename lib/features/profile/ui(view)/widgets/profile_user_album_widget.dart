import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/widgets/custom_button_widget.dart';
import '../../../../core/common/widgets/discover_image_widget.dart';
import '../../providers(view-model)/profile_provider.dart';

class ProfileUserAlbumWidget extends StatelessWidget {
  const ProfileUserAlbumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var providerT = Provider.of<ProfileProvider>(context, listen: true);
    var provider = Provider.of<ProfileProvider>(context, listen: false);
    return Column(children: [
      Row(
        children: [
          buildImageColumn(providerT.rightImages, false),
          const SizedBox(
            width: 9,
          ),
          buildImageColumn(providerT.leftImages, true)
        ],
      ),
      SizedBox(
        height: 22,
      ),
      CustomButtonWidget(
          buttonText: 'See More'.toUpperCase(),
          buttonThemeIsDark: false,
          buttonOnPressed: () {
            provider.fetchPhotos(2, 6, providerT.start += 6, true);
          }),
      SizedBox(
        height: 32,
      )
    ]);
  }

  Widget buildImageColumn(List listOfPhotos, bool firstPattern) {
    return Expanded(
      child: Column(
        children: List.generate(
          listOfPhotos.length,
          (index) {
            return Column(
              children: [
                Container(
                  height: firstPattern == true
                      ? index % 3 == 2
                          ? 220
                          : 310
                      : index % 3 == 0
                          ? 220
                          : 310,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: ImageWidget(
                    imageUrl: listOfPhotos[index].url,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

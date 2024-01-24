import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/custom_button_widget.dart';
import '../../../../common/widgets/discover_image_widget.dart';
import '../../providers(view-model)/search_provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text('ALL RESULTS', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(
          height: 24,
        ),
        Consumer<SearchProvider>(builder: (context, photoProvider, child) {
          if (photoProvider.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11.0,
                mainAxisSpacing: 11.0,
              ),
              itemCount: photoProvider.photos.length,
              itemBuilder: (context, index) {
                return ImageWidget(
                  imageUrl: photoProvider.photos[index].url,
                );
              },
            );
          }
        }),
        const SizedBox(
          height: 32,
        ),
        CustomButtonWidget(
            buttonText: 'SEE MORE',
            buttonThemeIsDark: false,
            buttonOnPressed: () {
              FocusScope.of(context).unfocus();
              provider.fetchPhotos(1, 9, provider.startIndex += 15, true);
            }),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

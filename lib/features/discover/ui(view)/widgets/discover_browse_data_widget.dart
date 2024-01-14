import 'package:app/core/common/widgets/discover_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers(view-model)/discover_provider.dart';

class BrowseImages extends StatelessWidget {
  const BrowseImages({super.key});

  // Заданные паттерны блоков
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DiscoverProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            buildColumn(provider.patterns[0], provider.leftImages, context),
            SizedBox(
              width: 9,
            ),
            buildColumn(provider.patterns[1], provider.rightImages, context),
          ],
        ),
      ],
    );
  }

  Widget buildColumn(List<int> pattern, imageUrls, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        pattern.length,
        (index) => index < imageUrls.length
            ? Container(
                height: pattern[index].toDouble(),
                width: MediaQuery.of(context).size.width / 2 - 21,
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: ImageWidget(
                  imageUrl: imageUrls[index].url,
                ))
            : const SizedBox(),
      ),
    );
  }
}

import 'package:app/features/discover/providers(view-model)/discover_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var providerF = Provider.of<DiscoverProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        providerF.showFullScreenImage(imageUrl, context);
      },
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          alignment: Alignment.center,
          height: 130,
          width: 130,
          child: const CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

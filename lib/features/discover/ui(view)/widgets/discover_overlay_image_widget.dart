import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DiscoverOverlayImageWidget extends StatelessWidget {
  final String imageUrl;

  const DiscoverOverlayImageWidget({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            imageUrl: imageUrl,
          ),
          Container(
            height: 306,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(0, 255, 255, 0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 46, right: 14, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '@email',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
                const Spacer(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const SizedBox(
                      height: 32,
                      width: 32,
                      child: Icon(Icons.close, size: 20, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

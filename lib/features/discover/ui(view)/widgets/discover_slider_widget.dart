import 'package:app/features/discover/providers(view-model)/discover_provider.dart';
import 'package:app/core/common/widgets/discover_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class DiscoverSliderWidget extends StatelessWidget {
  const DiscoverSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 387,
        
        width: double.infinity,
        child: Consumer<DiscoverProvider>(
            builder: (context, photoProvider, child) {
          if (photoProvider.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  enableInfiniteScroll: true,
                  autoPlay: false),
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    SizedBox(
                      height: 343,
                      width: double.infinity,
                      child: ImageWidget(
                        imageUrl: photoProvider.photos[index].url,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
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
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '@email',
                              style: Theme.of(context).textTheme.displaySmall,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
              },
            );
          }
        }));
  }
}

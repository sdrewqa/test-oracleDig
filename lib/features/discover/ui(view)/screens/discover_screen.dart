import 'package:app/common/widgets/custom_button_widget.dart';
import 'package:app/features/discover/providers(view-model)/discover_provider.dart';
import 'package:app/features/discover/ui(view)/widgets/discover_browse_data_widget.dart';
import 'package:app/features/discover/ui(view)/widgets/discover_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DiscoverProvider>(context, listen: false)
          .fetchPhotos(1, 10, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DiscoverProvider>(context, listen: true);
    var providerF = Provider.of<DiscoverProvider>(context, listen: false);
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'What’s new today'.toUpperCase(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                DiscoverSliderWidget(),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Browse all'.toUpperCase(),
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                BrowseImages(),
                const SizedBox(
                  height: 32,
                ),
                CustomButtonWidget(
                    buttonText: 'see more'.toUpperCase(),
                    buttonThemeIsDark: false,
                    buttonOnPressed: () {
                      Provider.of<DiscoverProvider>(context, listen: false)
                          .addNewPhtosToBrowse(1, 10, providerF.start += 10);
                    }),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

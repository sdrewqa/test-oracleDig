import 'package:app/common/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers(view-model)/search_provider.dart';
import '../widgets/search_results_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context, listen: false);
    var providerT = Provider.of<SearchProvider>(context, listen: true);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
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
                      'Search',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextFieldWidget(
                        controller: provider.searchController,
                        hintText: 'Search all photos',
                        keyboardType: TextInputType.multiline,
                        autoFocus: false,
                        onChangedFun: provider.onSearchChanged),
                    providerT.searchController.text.isEmpty
                        ? const SizedBox()
                        : const SearchResult()
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

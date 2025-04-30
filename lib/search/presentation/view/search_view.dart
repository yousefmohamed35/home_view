import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/search/presentation/view/widgets/search_app_bar.dart';
import 'package:homeview/search/presentation/view/widgets/search_history_list.dart';
import 'package:homeview/search/presentation/view/widgets/search_text_field.dart';
import 'package:homeview/search/presentation/view/filter_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchView> {
  List<String> searchHistory = ["General Electric", "Bank of America"];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: SearchAppBar(onBackButtonPressed: () => Navigator.pop(context)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchTextField(
              controller: searchController,
              onFilterPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterView()),
                );
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: SearchHistoryList(
                searchHistory: searchHistory,
                onRemoveItem: (index) {
                  setState(() {
                    searchHistory.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

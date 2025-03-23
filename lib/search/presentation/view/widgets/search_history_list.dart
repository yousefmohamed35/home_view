import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class SearchHistoryList extends StatelessWidget {
  final List<String> searchHistory;
  final Function(int) onRemoveItem;

  const SearchHistoryList({
    super.key,
    required this.searchHistory,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.history_rounded, color: AppColors.borderColor),
          title: Text(searchHistory[index], style: TextStyle(color: AppColors.borderColor)),
          trailing: IconButton(
            icon: Icon(Icons.close, color: AppColors.borderColor),
            onPressed: () => onRemoveItem(index),
          ),
        );
      },
    );
  }
}
import 'package:blog/ui/themes/app_color.dart';
import 'package:blog/ui/themes/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String s) onActionDone;
  final Function(String s)? onActionChanged;

  const SearchView(
      {this.controller,
      required this.onActionDone,
      this.onActionChanged,
      super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: AppColors.contentPlaceholder,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onSubmitted: (value) {
                widget.onActionDone(value);
              },
              onChanged: (value) {
                if (widget.onActionChanged != null) {
                  widget.onActionChanged!(value);
                }
              },
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Search mail ...",
                  hintStyle: Theme.of(context).textTheme.labelMedium),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}

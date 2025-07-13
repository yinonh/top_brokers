import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class SearchBarWidget extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const SearchBarWidget({
    super.key,
    this.initialValue = '',
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
        vertical: AppDimensions.smallPadding,
      ),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppConstants.shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: AppStrings.searchBrokers,
          hintStyle: TextStyle(
            color: AppConstants.textSecondaryColor,
            fontSize: AppDimensions.defaultFontSize,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppConstants.textSecondaryColor,
            size: AppDimensions.defaultIconSize,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppConstants.textSecondaryColor,
                    size: AppDimensions.defaultIconSize,
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onClear();
                    _focusNode.unfocus();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.defaultPadding,
            vertical: AppDimensions.defaultPadding,
          ),
        ),
        style: TextStyle(
          fontSize: AppDimensions.defaultFontSize,
          color: AppConstants.textPrimaryColor,
        ),
      ),
    );
  }
}

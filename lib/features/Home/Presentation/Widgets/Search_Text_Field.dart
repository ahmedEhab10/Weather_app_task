import 'package:flutter/material.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClear,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      cursorColor: theme.colorScheme.primary,
      textInputAction: TextInputAction.search,
      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'Search for a city...',
        hintStyle: TextStyle(
          color: isDark ? Colors.white54 : Colors.black38,
          fontWeight: FontWeight.w400,
        ),

        prefixIcon: Icon(
          Icons.search_rounded,
          color: isDark ? Colors.white70 : Colors.black54,
          size: 24,
        ),

        // suffixIcon: IconButton(
        //   onPressed: onClear,
        //   splashRadius: 20,
        //   icon: IconButton(
        //     onPressed: onClear,
        //     splashRadius: 20,
        //     icon: Icon(
        //       Icons.close_rounded,
        //       color: isDark ? Colors.white70 : Colors.black54,
        //     ),
        //   ),
        // ),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: onClear,
                splashRadius: 20,
                icon: Icon(
                  Icons.close_rounded,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              )
            : null,
        filled: true,
        fillColor: isDark ? const Color(0xff1E293B) : Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: isDark
                ? Colors.white.withOpacity(.08)
                : const Color(0xffE5E7EB),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}

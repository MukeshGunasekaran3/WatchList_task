import 'package:flutter/material.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/widgets/custom_textformfield.dart';
import 'package:watchlist_task/core/theme/color_palete.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        centerTitle: true,
        title: CustomTextformfield(
            onTap: () {},
            hintText: 'Search & Add',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  size: 18,
                  Icons.grid_view_sharp,
                  color: ColorPallete.dark_secondaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  size: 18,
                  Icons.settings_input_composite_rounded,
                  color: ColorPallete.dark_secondaryColor,
                ),
                SizedBox(
                  width: 15,
                )
              ],
            )),
      ),
      body: Center(
        child: Text(
          "No Data",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}

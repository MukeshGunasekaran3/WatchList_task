import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watchlist_task/core/theme/color_palete.dart';

class CustomListTile extends StatelessWidget {
  final String symbol;
  final String exchange;
  final double price;
  final double change;
  final double percentageChange;

  const CustomListTile(
      {super.key,
      required this.symbol,
      required this.exchange,
      required this.price,
      required this.change,
      required this.percentageChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(symbol),
      subtitle: Text(exchange),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price.toString(),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorPallete.dark_secondaryColor),
          ),
          Text(
            "+${change} (${percentageChange}%)",
            style: const TextStyle(color: ColorPallete.dark_secondaryColor),
          ),
        ],
      ),
    );
  }
}

import 'package:cards/src/card_feature/card_item.dart';
import 'package:flutter/material.dart';

class CardItemView extends StatelessWidget {
  final CardItem card;
  final bool showTitle;
  final Function? onTap;

  const CardItemView({
    Key? key,
    required this.card,
    this.showTitle = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: card.color.toColor(),
            width: 24,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            if (showTitle)
              Center(
                child: Text(
                  card.label,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            const SizedBox(height: 8),
            card.id.toBarcode(
                context: context,
                height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

import 'package:cards/src/card_feature/card_item.dart';
import 'package:cards/src/card_feature/card_service.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class CardItemDetailsView extends StatelessWidget {
  final CardService cardService;

  const CardItemDetailsView({
    Key? key,
    required this.cardService,
  }) : super(key: key);

  static const routeName = '/card_item';

  @override
  Widget build(BuildContext context) {
    dynamic cardId = ModalRoute.of(context)?.settings.arguments;
    CardItem cardItem = cardService.getCardItem(cardId);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: cardItem.id.toBarcode(
                  context: context,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

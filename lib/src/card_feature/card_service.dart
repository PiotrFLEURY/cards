import 'package:cards/src/card_feature/card_item.dart';

class CardService {
  final items = [
    CardItem(
      id: '1234567890',
      color: 'ff0000',
      label: 'Action',
    ),
    CardItem(
      id: '0987654321',
      color: '00ff00',
      label: 'Auchan',
    ),
    CardItem(
      id: '098456132',
      color: '0000ff',
      label: 'Leclerc',
    ),
  ];

  CardItem getCardItem(String id) => items.firstWhere((item) => item.id == id);

  void addItem(CardItem item) {
    items.add(item);
  }
}

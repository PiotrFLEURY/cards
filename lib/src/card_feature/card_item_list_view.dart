import 'package:cards/src/card_feature/card_item_creation_page.dart';
import 'package:cards/src/card_feature/card_item_details_view.dart';
import 'package:cards/src/card_feature/card_item_slot.dart';
import 'package:cards/src/card_feature/card_service.dart';
import 'package:cards/src/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Displays a list of SampleItems.
class CardItemListView extends StatefulWidget {
  final CardService cardService;

  const CardItemListView({
    Key? key,
    required this.cardService,
  }) : super(key: key);

  static const routeName = '/';

  @override
  State<CardItemListView> createState() => _CardItemListViewState();
}

class _CardItemListViewState extends State<CardItemListView> {
  final _cards = [];

  @override
  void initState() {
    _cards.addAll(widget.cardService.items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Currently ${widget.cardService.items.length} cards registered',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.white),
              ),
              background: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.flutter_dash,
                  size: 76.0,
                  color: Colors.grey[100],
                ),
              ),
            ),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _onRefresh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onPressed: () async {
                  dynamic newCard = await Navigator.pushNamed(
                      context, CardItemCreationPage.routeName);
                  widget.cardService.addItem(newCard);
                  _onRefresh();
                },
                text: 'Add new one',
                icon: Icons.add,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                    bottom: 1,
                  ),
                  child: Slidable(
                    child: CardItemSlot(
                      card: widget.cardService.items[index],
                    ),
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Navigator.of(context).restorablePushNamed(
                              CardItemDetailsView.routeName,
                              arguments: widget.cardService.items[index].id,
                            );
                          },
                          icon: Icons.zoom_in,
                          label: 'Zoom',
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) async {
                            dynamic card =
                                await Navigator.of(context).pushNamed(
                              CardItemCreationPage.routeName,
                              arguments: widget.cardService.items[index],
                            );
                            widget.cardService.items[index] = card;
                            _onRefresh();
                          },
                          icon: Icons.edit,
                          label: 'Edit',
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        SlidableAction(
                          onPressed: (_) {
                            widget.cardService.items.removeAt(index);
                            _onRefresh();
                          },
                          icon: Icons.delete,
                          label: 'Delete',
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: widget.cardService.items.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    setState(() {
      _cards.clear();
      _cards.addAll(widget.cardService.items);
    });
  }
}

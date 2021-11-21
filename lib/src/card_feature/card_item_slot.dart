import 'package:cards/src/card_feature/card_item.dart';
import 'package:cards/src/card_feature/card_item_details_view.dart';
import 'package:cards/src/card_feature/card_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItemSlot extends StatefulWidget {
  final CardItem card;

  const CardItemSlot({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  State<CardItemSlot> createState() => _CardItemSlotState();
}

class _CardItemSlotState extends State<CardItemSlot> {
  double _heightFactor = 0.5;

  void _toggleHeight() {
    setState(() {
      _heightFactor = _heightFactor == 0.5 ? 1 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      tween: Tween(begin: 0.5, end: _heightFactor),
      builder: (context, value, child) {
        return Material(
          color: Theme.of(context).cardColor,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipPath(
                  clipper: _CardItemSlotClipper(heightFactor: value),
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: value,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CardItemView(
                        card: widget.card,
                        showTitle: false,
                        onTap: () {
                          Navigator.of(context).restorablePushNamed(
                            CardItemDetailsView.routeName,
                            arguments: widget.card.id,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _toggleHeight,
                  child: Text(
                    widget.card.label,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CardItemSlotClipper extends CustomClipper<Path> {
  double heightFactor;

  _CardItemSlotClipper({
    required this.heightFactor,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * heightFactor, size.width, size.height);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BoxShadowPainter extends CustomPainter {
  final _CardItemSlotClipper clipper;

  const BoxShadowPainter({
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawShadow(clipper.getClip(size), Colors.grey, 4.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

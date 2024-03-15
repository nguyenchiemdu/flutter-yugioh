import 'package:flutter/material.dart';
import 'package:yugi_oh_flutter/models/card.model.dart';

class CardItem extends StatefulWidget {
  const CardItem({required this.card, super.key});
  final CardModel card;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  double visible = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        textStyle: TextStyle(color: Colors.white),
        child: InkWell(
          onHover: (value) {
            setState(() {
              visible = value ? 0.5 : 1;
            });
          },
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Opacity(
              opacity: visible,
              child: Container(
                width: 50,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.card.url),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.card.cardName),
                      Text(widget.card.cardNumber),
                      Text(widget.card.rarity),
                      Text(widget.card.cardType),
                      Text(widget.card.attribute),
                      Text(widget.card.types),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardModel {
  String cardNumber;
  String rarity;
  String cardName;
  String cardType;
  String attribute;
  String types;
  String level;
  String url;

  CardModel({
    required this.cardNumber,
    required this.rarity,
    required this.cardName,
    required this.cardType,
    required this.attribute,
    required this.types,
    required this.level,
    required this.url,
  });

  static CardModel defaultCard() {
    return CardModel(
        cardNumber: '00000000',
        rarity: 'Common',
        cardName: 'CardModel Name',
        cardType: 'Monster',
        attribute: 'Dark',
        types: 'Fiend/Effect',
        level: '4',
        url:
            'https://i.pinimg.com/236x/a8/12/05/a81205f3f1116ae4009000a0534bc2a3.jpg');
  }

  static CardModel fromJson(Map<String, dynamic> json) {
    return CardModel(
        cardNumber: json['Card_number'],
        rarity: json['Rarity'],
        cardName: json['Card_name'],
        cardType: json['Card_type'],
        attribute: json['Attribute'] ?? '--',
        types: json['Types'] ?? '--',
        level: json['Level'] ?? '--',
        url:
            'https://i.pinimg.com/236x/a8/12/05/a81205f3f1116ae4009000a0534bc2a3.jpg'
        // url: json['Image_name'] != null
        //     ? 'https://example.com/images/${json['Image_name']}'
        //     : '',
        );
  }

  @override
  String toString() {
    return 'CardModel{cardNumber: $cardNumber, rarity: $rarity, cardName: $cardName, cardType: $cardType, attribute: $attribute, types: $types, level: $level, url: $url}';
  }
}

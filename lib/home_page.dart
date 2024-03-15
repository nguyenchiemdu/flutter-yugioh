import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yugi_oh_flutter/api/api_service.dart';
import 'package:yugi_oh_flutter/card_item.dart';
import 'package:yugi_oh_flutter/models/card.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SearchController controller = SearchController();
  List<CardModel> cards = [];
  @override
  void initState() {
    controller.addListener(() async {
      final searchText = controller.text;
      log(searchText);
      if (searchText.isEmpty) return;
      final apiService = ApiService(baseUrl: 'https://buidish.com/');
      final data = await apiService.get('/yugi_oh_index/_search', searchText);
      final hits = data['hits']['hits'] as List<dynamic>;
      final listCardJson = hits.map((e) => e['_source']).toList();
      setState(() {
        cards = listCardJson.map((e) => CardModel.fromJson(e)).toList();
      });
      for (final card in cards) {
        log(card.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: SearchAnchor.bar(
            viewElevation: 0,
            barElevation: MaterialStateProperty.all<double>(0),
            searchController: controller,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
      ),
      body: SafeArea(
        child: GridView.builder(
            itemCount: cards.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, childAspectRatio: 0.5),
            itemBuilder: (_, index) => CardItem(
                  card: cards[index],
                )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:word_bucket/components/item_dashboard.dart';
import 'package:word_bucket/screens/words/words_list_panel.dart';

@Deprecated("Do not use it")
class FeaturesItemsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemDashboard(
            Icons.find_in_page,
            'Suas palavras',
            onclick: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => WordsListPanel()
              ),);
            },
          ),
          ItemDashboard(
            Icons.add,
            'Criar nova palavra',
            onclick: () {},
          ),
          ItemDashboard(
            Icons.find_in_page,
            'Suas palavras salvas',
            onclick: () {},
          ),
        ],
      ),
    );
  }
}

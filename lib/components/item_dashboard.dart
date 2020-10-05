import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final IconData _icon;
  final String _description;
  final Function onclick;

  ItemDashboard(this._icon, this._description, {@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Padding externo do container
      child: Material(
        // Usamos isso aqui para dar ao evento de clique do nosso container, o visual do material.
        color: Theme.of(context).primaryColor,
        child: InkWell(
          // InkWell nos permite dar funcionalidades de clique para elementos que nao tenham, nesse caso,um container;
          onTap: () {
            onclick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            // Padding interno do container
            height: 110,
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  _description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

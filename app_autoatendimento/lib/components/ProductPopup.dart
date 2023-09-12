import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPopup extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductPopup(this.product);

  @override
  _ProductPopupState createState() => _ProductPopupState();
}

class _ProductPopupState extends State<ProductPopup> {
  int _quantity = 1;
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.product['nome']),
          Text(widget.product['descricao']),
          Text(
            '${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(widget.product['preco'] * _quantity)}',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--;
                    }
                  });
                },
                icon: Icon(Icons.remove),
              ),
              Text(_quantity.toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Adicione ação para realizar o pedido aqui
              // Aqui, você pode usar os valores de widget.product, _quantity e _descriptionController.text
              // para enviar um pedido ou fazer o que for necessário.
              Navigator.of(context).pop();
            },
            child: Text('+ Pedido'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}

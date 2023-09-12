import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaProdutos extends StatefulWidget {
  final List<dynamic> produtos;

  ListaProdutos(this.produtos);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  Map<String, dynamic>? _selectedProduct;
  int _quantity = 1;
  TextEditingController _descriptionController = TextEditingController();

  _openProductPopup(Map<String, dynamic> product) {
    setState(() {
      _selectedProduct = product;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(product['nome']),
              Text(product['descricao']),
              Text(
                '${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(product['preco'] * _quantity)}',
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
                  // Aqui, você pode usar os valores de _selectedProduct, _quantity e _descriptionController.text
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
                setState(() {
                  _selectedProduct = null;
                });
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

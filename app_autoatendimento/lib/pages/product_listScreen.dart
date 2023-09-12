// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class ProductSearch extends StatelessWidget {
  List<dynamic> products = [];

  ProductSearch({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return Card(
          child: Column(
            children: [
              Container(
                color: Colors.grey[300], // Cor de fundo do espaço da foto
                height: 150,
                width: double.infinity,
              ),
              SizedBox(height: 8),
              Text(
                product['nome'],
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'R\$ ${product['preco']}',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}

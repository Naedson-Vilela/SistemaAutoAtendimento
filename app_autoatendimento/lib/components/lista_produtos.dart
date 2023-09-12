import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ProductPopup.dart';

class ListaProdutos extends StatefulWidget {
  final List<dynamic> produtos;

  ListaProdutos(this.produtos);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.produtos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (BuildContext context, int index) {
              final product = widget.produtos[index];
              return GestureDetector(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       content: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           // Adicione os detalhes do produto no pop-up aqui
                  //           Text(product['nome']),
                  //           Text(product['descricao']),
                  //           Text(
                  //             '${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(product['preco'])}',
                  //           ),
                  //           // Adicione mais detalhes do produto aqui
                  //         ],
                  //       ),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('Fechar'),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ProductPopup(product);
                    },
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        _checkImageNullWidget(product["imagem"]),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            product['nome'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            height: 40,
                            child: Text(
                              product['descricao'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(product['preco'])}',
                              style: TextStyle(fontSize: 14),
                            ),
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Transform.translate(
                                  offset: Offset(-4, -4),
                                  child: IconButton(
                                    onPressed: () {
                                      // Adicione ação de adicionar ao carrinho aqui
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _checkImageNullWidget(dynamic url) {
    if (url == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.grey[600],
        ),
        height: 150,
        width: double.infinity,
      );
    }
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          image: DecorationImage(
              fit: BoxFit.cover,
              // image: NetworkImage(product['imagem']))),
              image: NetworkImage(url.replaceAllMapped(
                  "0.0.0.0", (match) => "192.168.18.51")))),
    );
  }
}

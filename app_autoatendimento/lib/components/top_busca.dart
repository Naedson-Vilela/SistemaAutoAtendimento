// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBusca extends StatelessWidget {
  // List<String> filteredProducts = [];
  // List<String> products;
  // List<String> filteredProducts;

  // TopBusca({
  //   Key? key,
  //   required this.products,
  //   required this.filteredProducts,
  // }) : super(key: key);

  // void filterProducts(String query) {
  //   filteredProducts = products.where((product) {
  //     return product.toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Procurar...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () async {},
            ),
            // prefixIcon: const IconButton(
            //   icon: Icon(Icons.clear),
            //   onPressed: () {

            //   },
            // ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }
}

//  onPressed: () async {
//               final searchResults = await showSearch(
//                 context: context,
//                 delegate: SearchDelegate<String>(
//                   onSearchQueryChanged: (query) {
//                     // Aqui você pode implementar a lógica de busca em tempo real
//                   },
//                   onSubmitted: (query) {
//                     // Aqui você pode exibir os resultados da busca em uma nova tela
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SearchResultsScreen(searchResults),
//                       ),

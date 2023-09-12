import 'package:app_autoatendimento/components/carouselSlider_produtos.dart';
import 'package:app_autoatendimento/components/categorias_slider.dart';
import 'package:app_autoatendimento/components/lista_produtos.dart';
import 'package:app_autoatendimento/components/top_busca.dart';
import 'package:app_autoatendimento/repositories/categorias_repository.dart';
import 'package:app_autoatendimento/repositories/produtos_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Produtos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<dynamic> products = [];
  List<dynamic> categories = [];
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    ProdutosRepository().get_Produtos().then((data) {
      setState(() {
        products = data;
      });
      CategoriasRepository().get_categorias().then((data) {
        setState(() {
          categories = data;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
              height: 10,
            ),
            TopBusca(),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            CategoriasSlider(categories),
            CarouselSliderProdutos(),
            ListaProdutos(products),
          ],
        ),
      ),
    );
  }
}

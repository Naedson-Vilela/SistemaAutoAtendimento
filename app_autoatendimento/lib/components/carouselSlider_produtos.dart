import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselSliderProdutos extends StatelessWidget {
  List<dynamic> produtos_slider = [];

  CarouselSliderProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Define o raio do border
            color: Colors.red, // Cor de fundo do item
          ),
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.circular(1)),
          // color: Colors.red,
          child: Center(
            child: Text(
              'Categoria 1',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Define o raio do border
            color: Colors.green, // Cor de fundo do item
          ),
          child: Center(
            child: Text(
              'Categoria 2',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Define o raio do border
            color: Colors.blue, // Cor de fundo do item
          ),
          child: Center(
            child: Text(
              'Categoria 3',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

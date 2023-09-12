import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoriesCarousel extends StatelessWidget {
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
          color: Colors.blue,
          child: const Center(
              child: Text(
            'categoria 1',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
              child: Text(
            'categoria 2',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
        ),
        Container(
          color: Colors.blue,
          child: const Center(
              child: Text(
            'categoria 3',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
        )
      ],
    );
  }
}

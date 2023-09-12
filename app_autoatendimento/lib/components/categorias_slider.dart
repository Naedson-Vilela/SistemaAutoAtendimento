import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriasSlider extends StatelessWidget {
  List<dynamic> categorias = [];

  CategoriasSlider(this.categorias);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          final categoria = categorias[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.category,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categoria['categoria'],
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

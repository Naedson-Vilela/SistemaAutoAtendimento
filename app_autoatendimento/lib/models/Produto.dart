import 'package:flutter/material.dart';

class Produto {
  final String nome, descricao;
  final double preco;
  final Image imagem;

  Produto(this.nome, this.descricao, this.preco, this.imagem);
}

from django.shortcuts import render
from rest_framework import request

from rest_framework import generics
from rest_framework.generics import get_object_or_404

from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import mixins

from rest_framework import permissions

from .models import Pedido, ItemPedido, Produto, Categoria, Mesa, ComandaCozinha
from .serializers import (PedidoSerializer,
                          ItemPedidoSerializer,
                          ProdutoSerializer,
                          CategoriaSerializer,
                          MesaSerializer,
                          ComandaCozinhaSerializer)


class MesasApiView(generics.ListCreateAPIView):
    queryset = Mesa.objects.all()
    serializer_class = MesaSerializer





class MesaApiView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Mesa.objects.all()
    serializer_class = MesaSerializer
    lookup_field = 'numero_mesa'


class ProdutosApiView(generics.ListAPIView):
    queryset = Produto.objects.all()
    serializer_class = ProdutoSerializer


class ProdutoApiView(generics.RetrieveAPIView):
    queryset = Produto.objects.all()
    serializer_class = ProdutoSerializer


class CategoriasApiView(generics.ListAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer


class CategoriaApiView(generics.RetrieveAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer


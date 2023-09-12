from rest_framework import serializers
from .models import Pedido, Mesa, ItemPedido, Produto, Categoria, ComandaCozinha


class PedidoSerializer(serializers.ModelSerializer):

    itens_pedidos = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = Pedido
        fields = (
            'mesa_id',
            'nome_cliente',
            'data_hora',
            'status',
            'produtos',
        )


class ItemPedidoSerializer(serializers.ModelSerializer):

    class Meta:
        model = ItemPedido
        fields = (
            'pedido_id',
            'prduto_id',
            'quantidade'
        )


class ComandaCozinhaSerizalizer(serializers.ModelSerializer):

    class Meta:
        model = ComandaCozinha
        fields = (
            'pedido_id',
            'status'
        )


class ProdutoSerializer(serializers.ModelSerializer):

    class Meta:
        model = Produto
        fields = (
            'nome',
            'categoria_id',
            'preco',
            'descricao',
            'imagem',
        )


class MesaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Mesa
        fields = (
            'numero_mesa',
            'status'
        )


class CategoriaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Categoria
        fields = (
            'categoria',
        )


class ComandaCozinhaSerializer(serializers.ModelSerializer):

    class Meta:
        model = ComandaCozinha
        fields = (
            'pedido_id',
            'status'
        )

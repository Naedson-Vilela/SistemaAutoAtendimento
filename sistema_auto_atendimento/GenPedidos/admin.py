from django.contrib import admin

from .models import ComandaCozinha, Mesa, Pedido, ItemPedido, Produto, Categoria

@admin.register(ComandaCozinha)
class ComandaCozinhaAdmin(admin.ModelAdmin):
    list_display = ('pedido_id', 'status',)

@admin.register(Mesa)
class MesaAdmin(admin.ModelAdmin):
    list_display = ('numero_mesa', 'status',)

@admin.register(Pedido)
class PedidoAdmin(admin.ModelAdmin):
    list_display = ('mesa_id', 'nome_cliente', 'data_hora', 'status',)

@admin.register(ItemPedido)
class ItemPedidoAdmin(admin.ModelAdmin):
    list_display = ('pedido_id', 'produto_id', 'quantidade',)
    list_editable = ('quantidade',)

@admin.register(Produto)
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('nome', 'categoria_id', 'preco', 'descricao', 'is_cozinha', 'imagem')
    list_editable = ('categoria_id', 'preco', 'descricao', 'is_cozinha')
    list_display_links = ('nome',)

@admin.register(Categoria)
class CaetegoriaAdmin(admin.ModelAdmin):
    list_display = ('categoria',)

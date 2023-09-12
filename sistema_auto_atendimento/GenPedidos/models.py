from django.db import models
from django.utils.translation import gettext_lazy as _
# Create your models here.


class Mesa(models.Model):

    class StatusMesaChoice(models.TextChoices):
        OCUPADA = 'OCU', _('Ocupada')
        LIVRE = 'LIV', _('Livre')
        RESERVADA = 'RES', _('Reservada')

    # qrcode = models.ImageField(unique=True, blank=True)
    status = models.CharField(max_length=3,
                              choices=StatusMesaChoice.choices,
                              default=StatusMesaChoice.LIVRE)
    numero_mesa = models.IntegerField(unique=True)

    class Meta:
        verbose_name = 'Mesa'
        verbose_name_plural = 'Mesas'
        ordering = ['id']

    def __str__(self):
        return f'{self.numero_mesa} - {self.status} '


class Categoria(models.Model):
    categoria = models.CharField(max_length=50, unique=True)

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'

    def __str__(self):
        return self.categoria


class Produto(models.Model):
    imagem = models.ImageField(blank=True)
    nome = models.CharField(max_length=100)
    categoria_id = models.ForeignKey(Categoria, related_name='produtos', on_delete=models.CASCADE)
    preco = models.FloatField()
    descricao = models.TextField(blank=True, default='')
    is_cozinha = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Produto'
        verbose_name_plural = 'Produtos'

    def __str__(self):
        return self.nome


class Pedido(models.Model):

    class StatusPedidoChoice(models.TextChoices):
        REALIZADO = 'REL', _('Realizado')
        INICIADO = 'INI', _('Aceito')
        PRONTO_ENTREGA = 'PEN', _('Pronto para entrega')
        ENTREGUE = 'ENT', _('Pedido entregado')
        FINALIZADO = 'FIM'

    mesa_id = models.ForeignKey(Mesa, related_name='pedidos', on_delete=models.CASCADE)
    nome_cliente = models.CharField(max_length=100)
    data_hora = models.DateTimeField(auto_now=True)
    status = models.CharField(max_length=3, choices=StatusPedidoChoice.choices, default=StatusPedidoChoice.REALIZADO)

    class Meta:
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'

    def __str__(self):
        return f'{self.id} - {self.nome_cliente}'


class ItemPedido(models.Model):
    pedido_id = models.ForeignKey(Pedido, related_name='ItensPedidos', on_delete=models.CASCADE)
    produto_id = models.ForeignKey(Produto, related_name='ItensProdutos', on_delete=models.CASCADE)
    quantidade = models.IntegerField()

    class Meta:
        verbose_name = 'ItemPedido'
        verbose_name_plural = 'ItensPedidos'

    def __str__(self):
        return f'{self.pedido_id} - {self.produto_id}'


class ComandaCozinha(models.Model):

    class StatusComandaCozinhaChoise(models.TextChoices):
        ACEITO = 'ACT', _('Aceito')
        AGUARDANDO = 'AGR', _('Aguardando')
        PROBLEMA = 'PCP', _('Problma com pedido')
        PRODUCAO = 'PRD', _('Em produção')
        FINALIZADO = 'FIM', _('Finalizado')

    pedido_id = models.ForeignKey(Pedido, related_name='ComandasCozinha', on_delete=models.CASCADE)
    status = models.CharField(max_length=3,
                              choices=StatusComandaCozinhaChoise.choices,
                              default=StatusComandaCozinhaChoise.AGUARDANDO)

    class Meta:
        verbose_name = 'ComandasCozinha'
        verbose_name_plural = 'ComandasCozinha'

    def __str__(self):
        return f'{self.pedido_id} - {self.status}'


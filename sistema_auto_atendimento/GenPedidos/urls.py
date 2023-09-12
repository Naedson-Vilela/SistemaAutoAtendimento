from django.urls import path
from .views import (MesasApiView,
                    MesaApiView,
                    CategoriasApiView,
                    CategoriaApiView,
                    ProdutosApiView,
                    ProdutoApiView, )

urlpatterns = [
    path('mesas/', MesasApiView.as_view(), name='mesas'),
    path('mesas/<int:numero_mesa>/', MesaApiView.as_view(), name='mesa'),
    path('categorias/', CategoriasApiView.as_view(), name='categorias'),
    path('categorias/<int:pk>/', CategoriaApiView.as_view(), name='categoria'),
    path('produtos/', ProdutosApiView.as_view(), name='produtos'),
    path('produtos/<int:pk>', ProdutoApiView.as_view(), name='produto')
]

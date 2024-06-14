from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path("subir_archivo/", views.subir, name="subir"),
    path("homepage/", views.homepage, name="homepage"),
    path("upload/", views.upload, name="upload"),
    path("lista-de-registros/", views.listarData, name="listarData")
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)

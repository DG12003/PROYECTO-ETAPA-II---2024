from django.shortcuts import render, redirect
from .forms import SubirDocumentoForm
from .models import SubirDocumento


def homepage(request):
    form = SubirDocumentoForm()
    return render(request, 'inicio.html', {'form': form})

def subir(request):
    form = SubirDocumentoForm()
    return render(request, 'subir_archivos.html', {'form': form})

def upload(request):
    if request.method == "POST":
        form = SubirDocumentoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
    #return render(request, 'index.html')               
    return redirect("subir")


def listarData(request):
    data = SubirDocumento.objects.all()
    print(data)
    return render(request=request, template_name="lista_archivos.html", context={'data': data})

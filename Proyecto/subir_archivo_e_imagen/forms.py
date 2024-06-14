from django import forms
from .models import SubirDocumento


class SubirDocumentoForm(forms.ModelForm):
    class Meta:
        model = SubirDocumento
        fields = ('documento',)

    """
    La función __init__ en Python es un método especial que se llama cuando se crea una instancia de una clase. 
    para este caso, sirve para personalizar la inicialización de la instancia del formulario.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['documento'].widget.attrs.update(
            {'accept': '.xlsx'})  # Permitir documentos solo con extensión .xlsx

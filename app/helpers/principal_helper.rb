module PrincipalHelper

  def construir_slider_eventos(filas)
    (slides = (filas.do / 4).ceil
    if slides == 0
      slides = 1
    end
    j = 0
    for i in 1..slides
      k = 1
      '<div class=' + (i==1 ? '"item active"' : '"item"') + '>'
      while k % 4 != 0
        '<div class="evento">'
        if j < filas.do
          filas.each[j]["tituloActividad"]
        end
        '</div>'
        k = k + 1
        j = j + 1
      end
      '</div>' 
    end).html_safe
  end
end

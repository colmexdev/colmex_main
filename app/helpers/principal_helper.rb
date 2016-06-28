module PrincipalHelper

  def construir_slider_eventos
    slides = (@resultado.each.length / 4).ceil
    if slides == 0
      slides = 1
    end
    j = 0
    for i in 1..slides 
      k = 1
      '<div class='.html_safe + (i==1 ? '"item active"'.html_safe : '"item"'.html_safe) + '>'.html_safe
      while k % 4 != 0
        '<div class="evento">'.html_safe
        if j < @resultado.each.length
          @resultado.each[j]["tituloActividad"].html_safe
        end
        '</div>'.html_safe
        k = k + 1
        j = j + 1
      end
      '</div>'.html_safe 
    end
  end
end

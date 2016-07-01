module PrincipalHelper

  def construye_slider
    i = 0
    html_block = ""
    control_block = ""
    Slider.all.each do |im|
      control_block = control_block + '<li data-target="#myCarousel" data-slide-to="' + i.to_s + '"' + (i == 0 ?  'class="active"' : '') + '></li>'


      html_block = html_block + '<div class="item ' + (i == 0 ?  "active" : "") + '">'
      html_block = html_block + link_to(image_tag(im.imagen_file_name),im.liga)
      html_block = html_block + '</div>'
      i = i + 1
    end
    control_block = '<ol class="carousel-indicators">'+control_block+'</ol>'
    html_block = '<div class="carousel-inner" role="listbox">'+html_block+'</div>'
    return (control_block+html_block).html_safe
  end
end

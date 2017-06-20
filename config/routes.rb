Rails.application.routes.draw do

  resources :catedras
  resources :academicos
  resources :personals
  resources :premiados
  resources :frases
  resources :sliders
  resources :documentos
  resources :cursos
  resources :tipo_cursos
  resources :descubres
  resources :contents
  resources :galleries
  resources :imagens
  resources :categoria
  resources :emeritos
  devise_for :admins, :controllers => { :registrations => "registrations"}
  resources :admins


  get 'bienes/index' => 'bienes#index', :as => :bienes

  get 'panel/panel' => 'panel#panel', :as => :panel
  get 'panel/principal' => 'panel#principal', :as => :panel_princ
  get 'panel/index' => 'panel#index', :as => :panel_index
  get 'panel/:id' => 'panel#mostrar', :as => :panel_mostrar

  get 'centros_de_estudio/inicio' => "centros_de_estudio#inicio", :as => :centros_de_estudio

  get 'centros_de_estudio/ceaa' => "centros_de_estudio#ceaa", :as => :ceaa

  get 'centros_de_estudio/cedua' => "centros_de_estudio#cedua", :as => :cedua

  get 'centros_de_estudio/ceh' => "centros_de_estudio#ceh", :as => :ceh

  get 'centros_de_estudio/cei' => "centros_de_estudio#cei", :as => :cei

  get 'centros_de_estudio/cee' => "centros_de_estudio#cee", :as => :cee

  get 'centros_de_estudio/cell' => "centros_de_estudio#cell", :as => :cell

  get 'centros_de_estudio/ces' => "centros_de_estudio#ces", :as => :ces

  get 'programas_academicos/inicio' => "programas_academicos#inicio", :as => :programas_academicos

  get 'programas_academicos/admisiones' => "programas_academicos#admisiones", :as => :admisiones

  get 'programas_academicos/programas' => 'programas_academicos#programas', :as => :programas

  get 'programas_academicos/convocatorias' => 'programas_academicos#convocatorias', :as => :convocatorias

  get 'programas_academicos/proceso' => 'programas_academicos#proceso', :as => :proceso

  get "programas_academicos/licenciaturas" => "programas_academicos#licenciaturas", :as => :licenciaturas

  get "programas_academicos/maestrias" => "programas_academicos#maestrias", :as => :maestrias

  get "programas_academicos/doctorados" => "programas_academicos#doctorados", :as => :doctorados

  get "programas_academicos/cursos" => "programas_academicos#cursos", :as => :cursos_varios

  get 'programas_academicos/catedras_y_seminarios' => "programas_academicos#catedras_y_seminarios", :as => :catedras_seminarios

  get "programas_academicos/catedras" => "programas_academicos#catedras", :as => :cats

  get "programas_academicos/seminarios" => "programas_academicos#seminarios", :as => :seminarios

  get 'informacion_general/autoridades' => 'informacion_general#autoridades', :as => :autoridades

  get 'informacion_general/profesores_emeritos' => 'informacion_general#profesores_emeritos', :as => :profesores_emeritos

  get 'informacion_general/historia' => 'informacion_general#historia', :as => :historia

  get 'informacion_general/sobre_el_colegio' => 'informacion_general#sobre_el_colegio', :as => :sobre_el_colegio

  get 'informacion_general/transparencia' => 'informacion_general#transparencia', :as => :transparencia

  get 'informacion_general/bienes' => 'informacion_general#bienes', :as => :bienes_part

  get 'informacion_general/licitaciones' => 'informacion_general#licitaciones', :as => :licitaciones

  get 'informacion_general/documentacion_institucional' => 'informacion_general#documentacion_institucional', :as => :documentacion

  get 'informacion_general/directorio_institucional' => 'informacion_general#directorio_institucional', :as => :dir_inst

  get 'informacion_general/actas' => 'informacion_general#actas', :as => :actas

  get 'informacion_general/informes' => 'informacion_general#informes', :as => :informes

  get 'informacion_general/estatutos' => 'informacion_general#estatutos', :as => :estatutos

  get 'informacion_general/asamblea' => 'informacion_general#asamblea', :as => :asamblea

  get 'informacion_general/junta' => 'informacion_general#junta', :as => :junta

  get 'informacion_general/presidencia' => 'informacion_general#presidencia', :as => :presidencia

  get 'informacion_general/centros_de_estudio' => 'informacion_general#centros_de_estudio', :as => :centros_autoridades

  get 'informacion_general/administracion' => 'informacion_general#administracion', :as => :administracion

  get 'informacion_general/unidades_de_apoyo' => 'informacion_general#unidades_de_apoyo', :as => :unidades_de_apoyo

  get "informacion_general/comision" => "informacion_general#comision", :as => :comision

  get "informacion_general/consejo" => "informacion_general#consejo", :as => :consejo

  get 'informacion_general/informacion_para_estudiantes' => 'informacion_general#informacion_para_estudiantes', :as => :info_estudiantes

  get 'informacion_general/operativas' => 'informacion_general#operativas', :as => :operativas

  get 'informacion_general/premios_y_distinciones' => 'informacion_general#premios_y_distinciones', :as => :premios

  get 'informacion_general/historia_75_años' => 'informacion_general#historia_75_años', :as => :historia75

  get 'informacion_general/comunidad' => 'informacion_general#comunidad', :as => :otorgadoscomunidad

  get 'informacion_general/colegio' => 'informacion_general#colegio', :as => :otorgadoscolegio

  get 'informacion_general/directorio_academico' => 'informacion_general#directorio_academico', :as => :directorio

  get 'informacion_general/marco_normativo' => 'informacion_general#marco_normativo', :as => :marco

  get 'programas_academicos/presenciales' => 'programas_academicos#presenciales', :as => :presenciales

  get 'programas_academicos/electronicos' => 'programas_academicos#electronicos', :as => :electronicos

  get 'programas_academicos/calendario_escolar' => 'programas_academicos#calendario_escolar', :as => :calendario

  get 'principal/principios_eticos' => 'principal#principios_eticos', :as => :principios

  get 'principal/principal'

  get 'principal/resultados_busqueda' => 'principal#resultados_busqueda', :as => :busqueda

  get 'principal/como_llegar' => 'principal#como_llegar', :as =>  :ubicacion

  get 'principal/set_language' => 'principal#set_language', :as => :cambiar_idioma

  get 'informacion_general/directorio_academico_async' => 'informacion_general#directorio_academico_async', :as => :dir_async

  get 'informacion_general/recuperar_docentes' => 'informacion_general#recuperar_docentes', :as => :rec_doc

  devise_scope :admin do
    get "/acceder" => "devise/sessions#new"
  end

  get "principal/sitemap" => "principal#sitemap", :as => :sitemap

  get 'principal/proximamente' => 'principal#proximamente', :as => :soon

  get 'principal/aviso_de_privacidad' => 'principal#aviso_de_privacidad', :as => :aviso


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "principal#principal"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

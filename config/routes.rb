Rails.application.routes.draw do

  #resources :catedras
  #resources :academicos
  #resources :personals
  #resources :premiados
  #resources :frases
  #resources :sliders
  #resources :documentos
  #resources :cursos
  #resources :tipo_cursos
  #resources :descubres
  #resources :contents
  #resources :galleries
  #resources :imagens
  #resources :categoria
  #resources :emeritos
  devise_for :admins, :controllers => { :registrations => "registrations", :sessions => "sessions"}
  resources :admins

  devise_scope :admin do
    get "/acceder" => "devise/sessions#new"
  end

  get 'bienes/index' => 'bienes#index', :as => :bienes

  get 'panel/panel' => 'panel#panel', :as => :panel
  get 'panel/principal' => 'panel#principal', :as => :panel_princ
  get 'panel/index' => 'panel#index', :as => :panel_index
  get 'panel/generar' => 'panel#generar', :as => :panel_nuevo
  get 'panel/editar' => 'panel#editar', :as => :panel_editar
  post 'panel' => 'panel#crear'
  get 'panel/:id' => 'panel#mostrar', :as => :panel_mostrar
  delete 'panel/:id' => 'panel#eliminar', :as => :panel_eliminar
  put 'panel/editar' => 'panel#actualizar'
  patch 'panel/editar' => 'panel#actualizar'
  put 'panel' => 'panel#actualizar'
  patch 'panel' => 'panel#actualizar'

  get '/' => 'principal#principal', :as => :main_es
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  get "/500_e", :to => "errors#internal_server_error"

  get '/catalogo_eventos' => 'principal#get_eventos', :as => :catalogo_eventos
  get '/cinta_eventos' => 'principal#cinta_eventos', :as => :cinta_eventos

  scope "(:locale)", locale: /(en)|(es)/ do
    get 'centros' => "centros_de_estudio#inicio", :as => :centros_de_estudio
    get 'ceaa' => "centros_de_estudio#ceaa", :as => :ceaa
    get 'cedua' => "centros_de_estudio#cedua", :as => :cedua
    get 'ceh' => "centros_de_estudio#ceh", :as => :ceh
    get 'cei' => "centros_de_estudio#cei", :as => :cei
    get 'cee' => "centros_de_estudio#cee", :as => :cee
    get 'cell' => "centros_de_estudio#cell", :as => :cell
    get 'ces' => "centros_de_estudio#ces", :as => :ces

    get 'programas' => "programas_academicos#inicio", :as => :programas_academicos
    get 'admisiones' => "programas_academicos#admisiones", :as => :admisiones
    get 'programas-docentes' => 'programas_academicos#programas', :as => :programas

    get 'convocatorias' => 'programas_academicos#convocatorias', :as => :convocatorias
    get 'proceso' => 'programas_academicos#proceso', :as => :proceso
    get "licenciaturas" => "programas_academicos#licenciaturas", :as => :licenciaturas
    get "maestrias" => "programas_academicos#maestrias", :as => :maestrias
    get "doctorados" => "programas_academicos#doctorados", :as => :doctorados
    get "cursos" => "programas_academicos#cursos", :as => :cursos_varios
    get 'catedras-seminarios' => "programas_academicos#catedras_y_seminarios", :as => :catedras_seminarios
    get "catedras" => "programas_academicos#catedras", :as => :cats
    get "seminarios" => "programas_academicos#seminarios", :as => :seminarios

    get 'autoridades' => 'informacion_general#autoridades', :as => :autoridades
    get 'profesores-emeritos' => 'informacion_general#profesores_emeritos', :as => :profesores_emeritos
    get 'historia' => 'informacion_general#historia', :as => :historia
    get 'sobre' => 'informacion_general#sobre_el_colegio', :as => :sobre_el_colegio
    #get 'transparencia' => 'informacion_general#transparencia', :as => :transparencia
    get 'bienes' => 'informacion_general#bienes', :as => :bienes_part
    get 'licitaciones' => 'informacion_general#licitaciones', :as => :licitaciones
    get 'documentacion-institucional' => 'informacion_general#documentacion_institucional', :as => :documentacion
    get 'directorio-institucional' => 'informacion_general#directorio_institucional', :as => :dir_inst
    get 'actas' => 'informacion_general#actas', :as => :actas
    get 'informes' => 'informacion_general#informes', :as => :informes
    get 'estatutos' => 'informacion_general#estatutos', :as => :estatutos
    get 'asamblea' => 'informacion_general#asamblea', :as => :asamblea
    get 'junta' => 'informacion_general#junta', :as => :junta
    get 'presidencia' => 'informacion_general#presidencia', :as => :presidencia
    get 'centros_de_estudio' => 'informacion_general#centros_de_estudio', :as => :centros_autoridades
    get 'administracion' => 'informacion_general#administracion', :as => :administracion
    get 'apoyo' => 'informacion_general#unidades_de_apoyo', :as => :unidades_de_apoyo
    get "comision" => "informacion_general#comision", :as => :comision
    get "consejo" => "informacion_general#consejo", :as => :consejo
    get 'info_estudiantes' => 'informacion_general#informacion_para_estudiantes', :as => :info_estudiantes
    get 'operativas' => 'informacion_general#operativas', :as => :operativas
    get 'premios-distinciones' => 'informacion_general#premios_y_distinciones', :as => :premios
    get 'historia-75-aniversario' => 'informacion_general#historia_75_años', :as => :historia75
    get 'comunidad' => 'informacion_general#comunidad', :as => :otorgadoscomunidad
    get 'colegio' => 'informacion_general#colegio', :as => :otorgadoscolegio
    get 'directorio-academico' => 'informacion_general#directorio_academico_drive', :as => :directorio
    #get 'marco-normativo' => 'informacion_general#marco_normativo', :as => :marco
    get 'presenciales' => 'programas_academicos#presenciales', :as => :presenciales
    get 'electronicos' => 'programas_academicos#electronicos', :as => :electronicos
    get 'dir-acad-test' => 'informacion_general#directorio_academico', :as => :dir

    get 'becas-postdoctorales' => 'informacion_general#becas_postdoctorales', :as => :postdocs
    get 'convocatorias-vigentes' => 'informacion_general#convocatorias_vigentes', :as => :pd_vig
    get 'becarios' => 'informacion_general#becas', :as => :becarios
    get 'convocatorias-pasadas' => 'informacion_general#convocatoriasp', :as => :conv_pd

    get 'calendario-escolar' => 'programas_academicos#calendario_escolar', :as => :calendario

    get 'principios-eticos' => 'principal#principios_eticos', :as => :principios

    get 'resultados_busqueda' => 'principal#resultados_busqueda', :as => :busqueda

    get 'como-llegar' => 'principal#como_llegar', :as =>  :ubicacion

    get 'set_language' => 'principal#set_language', :as => :cambiar_idioma

    get 'directorio_academico_async' => 'informacion_general#directorio_academico_async', :as => :dir_async
    get 'recuperar_docentes' => 'informacion_general#recuperar_docentes', :as => :rec_doc

    get "mapa-sitio" => "principal#sitemap", :as => :sitemap
    get 'proximamente' => 'principal#proximamente', :as => :soon
    get 'aviso-privacidad' => 'principal#aviso_de_privacidad', :as => :aviso
    get 'aviso-completo' => 'principal#aviso_completo', :as => :priv
    get 'aviso-simple' => 'principal#aviso_simple', :as => :priv_simple

    scope "editable" do
      get 'sobre' => 'informacion_general#sobre_el_colegio', :as => :sobre_el_colegio_edit
      get 'historia' => 'informacion_general#historia', :as => :historia_edit
      get 'historia-75-aniversario' => 'informacion_general#historia_75_años', :as => :hist_75_edit
      get 'premios-distinciones' => 'informacion_general#premios_y_distinciones', :as => :premios_edit
      get 'principios-eticos' => 'principal#principios_eticos', :as => :principios_edit
      get 'bienes' => 'informacion_general#bienes', :as => :bienes_edit
      #get 'transparencia' => 'informacion_general#transparencia', :as => :transparencia_edit
      get 'centros' => "centros_de_estudio#inicio", :as => :centros_edit
      get 'programas' => "programas_academicos#inicio", :as => :programas_edit
      get "licenciaturas" => "programas_academicos#licenciaturas", :as => :licenciaturas_edit
      get "maestrias" => "programas_academicos#maestrias", :as => :maestrias_edit
      get "doctorados" => "programas_academicos#doctorados", :as => :doctorados_edit
      get "cursos" => "programas_academicos#cursos", :as => :cursos_edit
      get 'calendario-escolar' => 'programas_academicos#calendario_escolar', :as => :calendario_edit
      get 'admisiones' => "programas_academicos#admisiones", :as => :admisiones_edit
      get 'convocatorias' => 'programas_academicos#convocatorias', :as => :convocatorias_edit
      get 'proceso' => 'programas_academicos#proceso', :as => :proceso_edit
      #get 'marco-normativo' => 'informacion_general#marco_normativo', :as => :marco_edit
      get 'autoridades' => 'informacion_general#autoridades', :as => :autoridades_edit
      get 'operativas' => 'informacion_general#operativas', :as => :operativas_edit
      get 'apoyo' => 'informacion_general#unidades_de_apoyo', :as => :unidades_de_apoyo_edit
      get 'administracion' => 'informacion_general#administracion', :as => :administracion_edit
      get 'centros_de_estudio' => 'informacion_general#centros_de_estudio', :as => :centros_autoridades_edit
      get "comision" => "informacion_general#comision", :as => :comision_edit
      get "consejo" => "informacion_general#consejo", :as => :consejo_edit
      get 'presidencia' => 'informacion_general#presidencia', :as => :presidencia_edit
      get 'junta' => 'informacion_general#junta', :as => :junta_edit
    end

  end
 
  get '/:locale' => 'principal#principal', :as => :main, :locale => /(en)|(es)/

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

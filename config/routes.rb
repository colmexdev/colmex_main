Rails.application.routes.draw do

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
  devise_for :admins
  resources :admins

  get 'panel/administrar' => 'panel#administrar', :as => :panel

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

  get "programas_academicos/licenciaturas" => "programas_academicos#licenciaturas", :as => :licenciaturas

  get "programas_academicos/maestrias" => "programas_academicos#maestrias", :as => :maestrias

  get "programas_academicos/doctorados" => "programas_academicos#doctorados", :as => :doctorados

  get "programas_academicos/cursos" => "programas_academicos#cursos", :as => :cursos_varios

  get 'sobre_el_colegio/autoridades' => 'sobre_el_colegio#autoridades', :as => :autoridades

  get 'sobre_el_colegio/profesores_emeritos' => 'sobre_el_colegio#profesores_emeritos', :as => :profesores_emeritos

  get 'sobre_el_colegio/historia' => 'sobre_el_colegio#historia', :as => :historia

  get 'sobre_el_colegio/informacion_general' => 'sobre_el_colegio#informacion_general', :as => :informacion_general

  get 'sobre_el_colegio/transparencia' => 'sobre_el_colegio#transparencia', :as => :transparencia

  get 'sobre_el_colegio/documentacion_institucional' => 'sobre_el_colegio#documentacion_institucional', :as => :documentacion

  get 'sobre_el_colegio/actas' => 'sobre_el_colegio#actas', :as => :actas

  get 'sobre_el_colegio/informes' => 'sobre_el_colegio#informes', :as => :informes

  get 'sobre_el_colegio/estatutos' => 'sobre_el_colegio#estatutos', :as => :estatutos

  get 'sobre_el_colegio/asamblea' => 'sobre_el_colegio#asamblea', :as => :asamblea

  get 'sobre_el_colegio/junta' => 'sobre_el_colegio#junta', :as => :junta

  get 'sobre_el_colegio/presidencia' => 'sobre_el_colegio#presidencia', :as => :presidencia

  get 'sobre_el_colegio/centros_de_estudio' => 'sobre_el_colegio#centros_de_estudio', :as => :centros_autoridades

  get 'sobre_el_colegio/administracion' => 'sobre_el_colegio#administracion', :as => :administracion

  get 'sobre_el_colegio/operativas' => 'sobre_el_colegio#operativas', :as => :operativas

  get 'sobre_el_colegio/premios_y_distinciones' => 'sobre_el_colegio#premios_y_distinciones', :as => :premios

  get 'sobre_el_colegio/historia_75_años' => 'sobre_el_colegio#historia_75_años', :as => :historia75

  get 'principal/principios_eticos' => 'principal#principios_eticos', :as => :principios

  get 'principal/principal'

  get 'principal/resultados_busqueda' => 'principal#resultados_busqueda', :as => :busqueda

  get 'principal/set_language' => 'principal#set_language', :as => :cambiar_idioma
  devise_scope :admin do
    get "/acceder" => "devise/sessions#new"
  end

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

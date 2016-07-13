Rails.application.routes.draw do

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
  

  get 'panel/administrar'

  get 'centros_de_estudio/inicio' => "centros_de_estudio#inicio", :as => :centros_de_estudio

  get 'centros_de_estudio/ceaa' => "centros_de_estudio#ceaa", :as => :ceaa

  get 'centros_de_estudio/cedua' => "centros_de_estudio#cedua", :as => :cedua

  get 'centros_de_estudio/ceh' => "centros_de_estudio#ceh", :as => :ceh

  get 'centros_de_estudio/cei' => "centros_de_estudio#cei", :as => :cei

  get 'centros_de_estudio/cee' => "centros_de_estudio#cee", :as => :cee

  get 'centros_de_estudio/cell' => "centros_de_estudio#cell", :as => :cell

  get 'centros_de_estudio/ces' => "centros_de_estudio#ces", :as => :ces

  get 'sobre_el_colegio/inicio' => 'sobre_el_colegio#inicio', :as => :sobre_el_colegio

  get 'sobre_el_colegio/premios_y_distinciones' => 'sobre_el_colegio#premios_y_distinciones', :as => :premios

  get 'principal/programas_academicos' => 'principal#programas_academicos', :as => :programas_academicos

  get 'principal/principios_eticos' => 'principal#principios_eticos', :as => :principios

  get 'principal/principal'

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

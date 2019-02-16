Rails.application.routes.draw do

  root 'pages#index'

  resources :pages
  get "print_weight" => "pages#print_weight"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

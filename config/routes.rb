Rails.application.routes.draw do
  root to: "products#index"
  resources :products

  post "product/:id/order", to: "products#order", as: :product_order
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

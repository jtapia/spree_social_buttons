Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :social_methods
  end
end

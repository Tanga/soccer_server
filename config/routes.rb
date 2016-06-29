Rails.application.routes.draw do
  resources :matches

  root :controller => "seeds", :action => "new"
  resources :seeds
end

Rails.application.routes.draw do
  resources :fixtures

  root :controller => "seeds", :action => "new"
  resources :seeds
end

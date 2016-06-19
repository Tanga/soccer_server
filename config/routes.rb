Rails.application.routes.draw do

  resources :seeds
  root :controller => "seeds", :action => "new"
end

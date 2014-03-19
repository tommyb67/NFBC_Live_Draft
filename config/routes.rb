NfbcLiveDraft::Application.routes.draw do

  resources :hitters do
    collection { post :import }
  end
  root 'hitters#index'
end



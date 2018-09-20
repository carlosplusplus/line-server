Rails.application.routes.draw do
  resources :lines, only: %i[show]
end

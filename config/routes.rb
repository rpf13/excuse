Rails.application.routes.draw do
  root "excuses#index"
  post "generate", to: "excuses#create"
end

Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'application#authentication_failed'

  root to: redirect('/auth/ditsso_internal')
end

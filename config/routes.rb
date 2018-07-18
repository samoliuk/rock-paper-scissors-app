Rails.application.routes.draw do
  root to: 'throws#new'

  post '/throw' => 'throws#throw'
end

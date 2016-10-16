# /config/routes.rb

Rails.application.routes.draw do
  root 'page#index'
  get '/timeline' => 'page#timeline'
end

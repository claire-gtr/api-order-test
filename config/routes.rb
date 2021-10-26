Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post 'routeOrder', to: "orders#routing_result"
  end
end
